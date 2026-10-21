# o2go-tools

أدوات O2Go:

- `stt/` تفريغ الفويسات (whisper.cpp + ggml-small-q5_1). التجهيز: `bash stt/setup.sh`
- `img/` أدوات الصور. التجهيز: `bash img/setup.sh`
  - `python3 img/bgremove.py in.jpg out.png [u2net|isnet-general-use]` — إزالة خلفية لصور المنتجات الحقيقية (مش للتصاميم على خلفية سادة)
  - `python3 img/vectorize.py in.png out.svg [scale]` — تحويل لفيكتور (نصوص/شعارات/ألوان مسطحة)
  - `bash img/ocr.sh image.jpg` — قراءة نص عربي وإنجليزي من صورة/سكرين شوت
