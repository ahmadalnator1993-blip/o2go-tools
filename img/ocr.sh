#!/bin/bash
# usage: ocr.sh image [psm]   -> نص عربي+إنجليزي
TESSDATA_PREFIX=/home/claude/tools/tessdata tesseract "$1" - -l ara+eng --psm ${2:-4} 2>/dev/null
