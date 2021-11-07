#!/bin/sh
# 引数 変換ファイル名
if [ $# != 1; then
    echo 引数エラー: $*
    exit 1
fi

echo "http立ち上げ確認"
wget -O - http://localhost:50021/docs

if [ $? != 0 ]; then
  exit 1
fi

datetime=`date +%Y%m%d_%H%M%S_%3N`

mkdir $datetime
cp $1 $datetime/$1
cd $datetime

echo "空行削除"
grep -v ^$ $1

echo "ファイル分割"
split -l 1 $1 -d --additional-suffix=.split
ls -v | grep .split | awk '{ printf "mv %s voice-%04d.split\n", $0, NR }' | sh
echo "$(ls -l)"

echo "JSON変換"
ls -v | grep .split | awk '{ printf "curl -s -X POST  \"localhost:50021/audio_query?speaker=1\" --get --data-urlencode text@%s > voice-%04d.json\n", $0, NR }' | sh
rm -rf *.split
echo "$(ls -l)"

echo "音声変換"
ls -v | grep .json | awk '{ printf "curl -s -H \"Content-Type: application/json\"  -X POST -d @%s localhost:50021/synthesis?speaker=1 > voice-%04d.wav\n", $0, NR }' | sh
rm -rf *.json

echo "$(ls -l)"

sox *.wav $1.wav
mv $1.wav ../$1.wav
rm -rf *.wav

cd ../
rm -rf $datetime
