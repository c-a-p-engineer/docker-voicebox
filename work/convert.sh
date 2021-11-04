#!/bin/sh
if [ $# != 1 ]; then
    echo 引数エラー: $*
    exit 1
fi

datetime=`date +%Y%m%d_%H%M%S_%3N`

mkdir $datetime
cp $1 $datetime/$1
cd $datetime

split -l 1 $1 -d --additional-suffix=.split
ls -v | grep .split | awk '{ printf "mv %s voice-%04d.split\n", $0, NR }' | sh
ls -v | grep .split | awk '{ printf "curl -s -X POST  \"localhost:50021/audio_query?speaker=1\" --get --data-urlencode text@%s > voice-%04d.json\n", $0, NR }' | sh
rm -rf *.split
ls -v | grep .json | awk '{ printf "curl -s -H \"Content-Type: application/json\"  -X POST -d @%s localhost:50021/synthesis?speaker=1 > voice-%04d.wav\n", $0, NR }' | sh
rm -rf *.json
sox *.wav orignal.wav
sox orignal.wav $1.wav speed 1.2
mv $1.wav ../$1.wav
rm -rf *.wav

cd ../
rm -rf $datetime
