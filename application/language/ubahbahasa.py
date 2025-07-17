import json
from deep_translator import GoogleTranslator

# Baca file JSON bahasa Inggris
with open("english.json", "r", encoding="utf-8") as f:
    english_data = json.load(f)

# Buat dictionary hasil terjemahan
translated_data = {}

# Terjemahkan setiap value
for key, value in english_data.items():
    try:
        translated_value = GoogleTranslator(source='en', target='id').translate(value)
        translated_data[key] = translated_value
    except Exception as e:
        print(f"Error on key '{key}': {e}")
        translated_data[key] = value  # fallback jika gagal diterjemahkan

# Simpan hasil terjemahan ke file baru
with open("indonesia.json", "w", encoding="utf-8") as f:
    json.dump(translated_data, f, indent=2, ensure_ascii=False)

print("✅ Terjemahan selesai. File disimpan sebagai 'indonesia.json'")
