import re

def parse_columns_no_duplicates(columns_block):
    fields = []
    foreign_keys = []
    seen_columns = set()

    lines = re.split(r',\s*\n', columns_block.strip())
    for line in lines:
        line = line.strip().rstrip(',')

        if line.upper().startswith(("PRIMARY", "UNIQUE", "KEY", "CONSTRAINT")):
            continue

        fk_match = re.match(r'FOREIGN KEY\s+\(`?(\w+)`?\)\s+REFERENCES\s+`?(\w+)`?\s*\(`?(\w+)`?\)', line, re.IGNORECASE)
        if fk_match:
            foreign_keys.append((fk_match.group(1), fk_match.group(2), fk_match.group(3)))
            continue

        match = re.match(r'`?(\w+)`?\s+([a-zA-Z]+)(\(\d+(,\d+)?\))?.*', line)
        if match:
            col_name, col_type, col_size, *_ = match.groups()
            if col_name in seen_columns:
                continue
            seen_columns.add(col_name)

            col_type_dbml = col_type.lower() + (col_size or '')
            flags = []
            if "AUTO_INCREMENT" in line.upper():
                flags.append("increment")
            if "NOT NULL" in line.upper():
                flags.append("not null")
            if "PRIMARY KEY" in line.upper():
                flags.append("pk")
            fields.append((col_name, col_type_dbml, flags))
    return fields, foreign_keys

def sql_to_dbml_no_dupes(sql):
    # tables = re.findall(r'CREATE TABLE\s+`?(\w+)`?\s*\((.*?)\)\s*(ENGINE|CHARSET|COMMENT)?;', sql, re.DOTALL | re.IGNORECASE)
    tables = re.findall(r'CREATE TABLE\s+`?(\w+)`?\s*\((.*?)\)\s*;', sql, re.DOTALL | re.IGNORECASE)
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
    input_path = "db_inatex.sql"  # Pastikan file ini ada di folder yang sama
    output_path = "output_dbml.txt"

    with open(input_path, "r", encoding="utf-8") as f:
        sql_content = f.read()

    dbml_output = sql_to_dbml_no_dupes(sql_content)

    with open(output_path, "w", encoding="utf-8") as f:
        f.write(dbml_output)

    print(f"✅ File DBML telah dibuat di: {output_path}")
