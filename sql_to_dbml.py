import re

def split_sql_items(block):
    """
    Split a CREATE TABLE (...) block into top-level comma-separated items,
    ignoring commas that are inside parentheses, single/double quotes, or backticks.
    """
    items = []
    cur = []
    paren = 0
    in_single = False
    in_double = False
    in_back = False
    i = 0
    while i < len(block):
        ch = block[i]
        # toggle quote/backtick states (ignore escapes for simplicity)
        if ch == "'" and not in_double and not in_back:
            in_single = not in_single
            cur.append(ch)
        elif ch == '"' and not in_single and not in_back:
            in_double = not in_double
            cur.append(ch)
        elif ch == '`' and not in_single and not in_double:
            in_back = not in_back
            cur.append(ch)
        elif not in_single and not in_double and not in_back:
            if ch == '(':
                paren += 1
                cur.append(ch)
            elif ch == ')':
                if paren > 0:
                    paren -= 1
                cur.append(ch)
            elif ch == ',' and paren == 0:
                item = ''.join(cur).strip()
                if item:
                    items.append(item)
                cur = []
            else:
                cur.append(ch)
        else:
            cur.append(ch)
        i += 1

    tail = ''.join(cur).strip()
    if tail:
        items.append(tail)
    return items

def parse_columns_no_duplicates(columns_block):
    """
    Parse column / constraint items into (ordered) fields and foreign keys.
    Returns:
      - fields: list of (name, type_token, flags_list)
      - foreign_keys: list of (fk_col, ref_table, ref_col)
    """
    items = split_sql_items(columns_block)
    fields_map = {}   # name -> (type, flags, order_index)
    order = 0
    foreign_keys = []
    pk_columns = []
    # capture UNIQUE KEY / UNIQUE INDEX that reference columns to mark unique
    unique_cols_from_constraints = []

    for item in items:
        s = item.strip()
        s_upper = s.upper()

        # Table-level PRIMARY KEY: PRIMARY KEY (`id`, `other`)
        if s_upper.startswith("PRIMARY KEY"):
            # extract column names inside parentheses
            cols_part = re.search(r'\((.*)\)', s, re.DOTALL)
            if cols_part:
                cols = re.findall(r'`?([^`\s,]+)`?', cols_part.group(1))
                for c in cols:
                    pk_columns.append(c)
            continue

        # FOREIGN KEY - with optional CONSTRAINT <name>
        fk_match = re.search(
            r'(?:CONSTRAINT\s+`?\w+`?\s+)?FOREIGN KEY\s*\(`?([^`)\s]+)`?\)\s*REFERENCES\s+`?([^`(\s]+)`?\s*\(`?([^`)\s]+)`?\)',
            s, re.IGNORECASE
        )
        if fk_match:
            fk_col, ref_table, ref_col = fk_match.groups()
            foreign_keys.append((fk_col, ref_table, ref_col))
            continue

        # UNIQUE KEY / UNIQUE INDEX that names a column list
        if s_upper.startswith(("UNIQUE KEY", "UNIQUE INDEX")):
            cols_part = re.search(r'\((.*)\)', s, re.DOTALL)
            if cols_part:
                cols = re.findall(r'`?([^`\s,]+)`?', cols_part.group(1))
                unique_cols_from_constraints.extend(cols)
            continue

        # Skip pure index/constraint lines (KEY, INDEX, CONSTRAINT (non-FK), CHECK, FULLTEXT, SPATIAL)
        if s_upper.startswith(("KEY ", "INDEX ", "CONSTRAINT ", "CHECK ", "FULLTEXT ", "SPATIAL ")):
            continue

        # Attempt to parse a column definition
        # Pattern: `name` <type-with-optional-parens> <rest...>
        # col_match = re.match(
        #     r'^\s*`?([^`\s(]+)`?\s+([a-zA-Z0-9_]+(?:\([^\)]*\))?)(.*)$',
        #     s,
        #     re.DOTALL
        # )

        col_match = re.match(
            r'^\s*`?([^\`\s(]+)`?\s+([a-zA-Z]+(?:\([^\)]*\))?(?:\s+[a-zA-Z]+)*)(.*)$',
            s,
            re.DOTALL | re.IGNORECASE
        )

        if not col_match:
            # didn't look like a column definition; skip
            continue

        col_name = col_match.group(1)
        type_token = col_match.group(2)     # e.g. int(11), varchar(255), decimal(10,2), longtext
        rest = col_match.group(3) or ""

        # skip duplicates
        if col_name in fields_map:
            continue

        flags = []
        if re.search(r'\bAUTO_INCREMENT\b', rest, re.IGNORECASE):
            flags.append("increment")
        if re.search(r'\bNOT NULL\b', rest, re.IGNORECASE):
            flags.append("not null")
        # inline PRIMARY KEY
        if re.search(r'\bPRIMARY KEY\b', rest, re.IGNORECASE):
            flags.append("pk")
        # inline UNIQUE
        if re.search(r'\bUNIQUE\b', rest, re.IGNORECASE):
            flags.append("unique")

        # store with order
        fields_map[col_name] = {"type": type_token.lower(), "flags": flags, "order": order}
        order += 1

    # apply pk columns from table-level PRIMARY KEY
    for p in pk_columns:
        if p in fields_map and "pk" not in fields_map[p]["flags"]:
            fields_map[p]["flags"].append("pk")

    # apply unique columns from UNIQUE KEY constraints
    for u in unique_cols_from_constraints:
        if u in fields_map and "unique" not in fields_map[u]["flags"]:
            fields_map[u]["flags"].append("unique")

    # produce ordered list of fields
    ordered_fields = sorted(fields_map.items(), key=lambda kv: kv[1]["order"])
    fields = [(name, info["type"], info["flags"]) for name, info in ordered_fields]

    return fields, foreign_keys

def sql_to_dbml_no_dupes(sql):
    # Match CREATE TABLE with any trailing table options before semicolon
    tables = re.findall(
        r'CREATE\s+TABLE\s+`?([^`\s(]+)`?\s*\((.*?)\)\s*[^;]*;',
        sql,
        re.DOTALL | re.IGNORECASE
    )

    dbml_lines = []

    for table_name, cols_block in tables:
        dbml_lines.append(f"Table {table_name} {{")
        fields, foreign_keys = parse_columns_no_duplicates(cols_block)

        for name, type_, flags in fields:
            flags_str = f" [{', '.join(flags)}]" if flags else ""
            dbml_lines.append(f"  {name} {type_}{flags_str}")

        dbml_lines.append("}")

        for fk_col, ref_table, ref_col in foreign_keys:
            dbml_lines.append(f"Ref: {table_name}.{fk_col} > {ref_table}.{ref_col}")

        dbml_lines.append("")

    return "\n".join(dbml_lines)

if __name__ == "__main__":
    input_path = "db_inatex.sql"
    output_path = "output_dbml.txt"
    with open(input_path, "r", encoding="utf-8") as f:
        sql_content = f.read()

    dbml_output = sql_to_dbml_no_dupes(sql_content)

    with open(output_path, "w", encoding="utf-8") as f:
        f.write(dbml_output)

    print(f"✅ File DBML telah dibuat di: {output_path}")

# import re

# def parse_columns_no_duplicates(columns_block):
#     fields = []
#     foreign_keys = []
#     seen_columns = set()

#     lines = re.split(r',\s*\n', columns_block.strip())
#     for line in lines:
#         line = line.strip().rstrip(',')

#         if line.upper().startswith(("PRIMARY", "UNIQUE", "KEY", "CONSTRAINT")):
#             continue

#         fk_match = re.match(r'FOREIGN KEY\s+\(`?(\w+)`?\)\s+REFERENCES\s+`?(\w+)`?\s*\(`?(\w+)`?\)', line, re.IGNORECASE)
#         if fk_match:
#             foreign_keys.append((fk_match.group(1), fk_match.group(2), fk_match.group(3)))
#             continue

#         match = re.match(r'`?(\w+)`?\s+([a-zA-Z]+)(\(\d+(,\d+)?\))?.*', line)
#         if match:
#             col_name, col_type, col_size, *_ = match.groups()
#             if col_name in seen_columns:
#                 continue
#             seen_columns.add(col_name)

#             col_type_dbml = col_type.lower() + (col_size or '')
#             flags = []
#             if "AUTO_INCREMENT" in line.upper():
#                 flags.append("increment")
#             if "NOT NULL" in line.upper():
#                 flags.append("not null")
#             if "PRIMARY KEY" in line.upper():
#                 flags.append("pk")
#             fields.append((col_name, col_type_dbml, flags))
#     return fields, foreign_keys

# def sql_to_dbml_no_dupes(sql):
#     # tables = re.findall(r'CREATE TABLE\s+`?(\w+)`?\s*\((.*?)\)\s*(ENGINE|CHARSET|COMMENT)?;', sql, re.DOTALL | re.IGNORECASE)
#     tables = re.findall(r'CREATE TABLE\s+`?(\w+)`?\s*\((.*?)\)\s*;', sql, re.DOTALL | re.IGNORECASE)


#     dbml_lines = []

#     for table_name, cols_block in tables:

#         dbml_lines.append(f"Table {table_name} {{")
#         fields, foreign_keys = parse_columns_no_duplicates(cols_block)

#         for name, type_, flags in fields:
#             flags_str = f" [{', '.join(flags)}]" if flags else ""
#             dbml_lines.append(f"  {name} {type_}{flags_str}")

#         dbml_lines.append("}")

#         for fk_col, ref_table, ref_col in foreign_keys:
#             dbml_lines.append(f"Ref: {table_name}.{fk_col} > {ref_table}.{ref_col}")

#         dbml_lines.append("")

#     return "\n".join(dbml_lines)

# if __name__ == "__main__":
#     input_path = "db_inatex.sql"  # Pastikan file ini ada di folder yang sama
#     output_path = "output_dbml.txt"

#     with open(input_path, "r", encoding="utf-8") as f:
#         sql_content = f.read()

#     dbml_output = sql_to_dbml_no_dupes(sql_content)

#     with open(output_path, "w", encoding="utf-8") as f:
#         f.write(dbml_output)

#     print(f"✅ File DBML telah dibuat di: {output_path}")
