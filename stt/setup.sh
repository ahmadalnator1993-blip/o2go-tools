#!/bin/bash
# Build whisper.cpp + assemble model into /home/claude/stt
set -e
D=/home/claude/stt; R=$(cd "$(dirname "$0")" && pwd); mkdir -p $D
[ -f $D/model.bin ] || cat $R/ggml-small-q5_1.bin.part* > $D/model.bin
[ -x $D/whisper.cpp/build/bin/whisper-cli ] || { cd $D; [ -d whisper.cpp ] || git clone --depth 1 https://github.com/ggml-org/whisper.cpp; cd whisper.cpp; cmake -B build -DCMAKE_BUILD_TYPE=Release -DWHISPER_BUILD_TESTS=OFF >/dev/null; cmake --build build -j$(nproc) --target whisper-cli >/dev/null; }
cp $R/stt.sh $D/stt.sh; chmod +x $D/stt.sh
echo "STT ready: $D/stt.sh <get_page_text_output_file>"
