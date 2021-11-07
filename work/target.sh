#!/bin/sh
# ターゲットディレクトリに入っているものを変換する
cd target
for txt in $( ls | grep .txt$ ); do   
    bash ../convert.sh ${txt} 2

    # エラー
    if [ $? != 0 ]; then
    exit 1
    fi

    # 完了したファイルを移動
    mv ${txt} ../complete/${txt}
    mv ${txt}.wav ../complete/${txt}.wav
done
