#!/bin/sh

if [ $# -ne 1 ]; then
  echo "変換するテキストファイルを指定してください" 1>&2c
  exit 1
fi

curl -s \
    -X POST \
    "localhost:50021/audio_query?speaker=1"\
    --get --data-urlencode text@$1 \
    > query.json

curl -s \
    -H "Content-Type: application/json" \
    -X POST \
    -d @query.json \
    localhost:50021/synthesis?speaker=1 \
    > audio.wav