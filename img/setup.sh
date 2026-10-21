#!/bin/bash
# تجهيز أدوات الصور: إزالة الخلفية (rembg) + فيكتور (vtracer) + قراءة نص (tesseract ara)
# ملاحظة: pypi لازم يمرّ عبر البروكسي، فبنشيل no_proxy لهالأوامر
set -e
export no_proxy=localhost NO_PROXY=localhost
python3 -c "import rembg,vtracer,cairosvg" 2>/dev/null || pip install --break-system-packages -q rembg vtracer cairosvg onnxruntime
mkdir -p ~/.u2net /home/claude/tools/tessdata
[ -s ~/.u2net/u2net.onnx ] || curl -sL -o ~/.u2net/u2net.onnx https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx
[ -s ~/.u2net/isnet-general-use.onnx ] || curl -sL -o ~/.u2net/isnet-general-use.onnx https://github.com/danielgatis/rembg/releases/download/v0.0.0/isnet-general-use.onnx
T=/home/claude/tools/tessdata
[ -s $T/eng.traineddata ] || cp /usr/share/tesseract-ocr/5/tessdata/{eng,osd}.traineddata $T/
[ $(stat -c%s $T/ara.traineddata 2>/dev/null || echo 0) -gt 1000000 ] || curl -sL -o $T/ara.traineddata https://raw.githubusercontent.com/tesseract-ocr/tessdata_best/main/ara.traineddata
R=$(cd "$(dirname "$0")" && pwd); chmod +x $R/*.sh
echo "IMG tools ready: bgremove.py | vectorize.py | ocr.sh  (in $R)"
