#!/bin/bash
# usage: stt.sh <page_text_json_with_FILEn_hex_dump>
cd /home/claude/stt; mkdir -p v; rm -f v/*
python3 - "$1" <<'P'
import json,re,sys
t=open(sys.argv[1]).read()
try: t=json.loads(t)[0]['text']
except Exception: pass
t=t[t.index('FILE0'):t.index('ENDDUMP')]
for m in re.finditer(r'FILE(\d+) ([0-9a-f \n]+)',t):
  open(f'v/v{m.group(1)}.ogg','wb').write(bytes.fromhex(re.sub(r'\s','',m.group(2))))
P
for f in v/*.ogg; do ffmpeg -loglevel error -y -i $f -ar 16000 -ac 1 ${f%.ogg}.wav; echo "== $f"; ./whisper.cpp/build/bin/whisper-cli -m model.bin -l ar -t 8 -nt -f ${f%.ogg}.wav 2>/dev/null; echo; done
