# Docker VOICEBOX環境

# Requirement
* [docker](https://www.docker.com/)

# Install
`.env.example` をコピー `.env` を作成。
各種設定値を修正。

## Docker起動
```
docker-compose up -d --build
```

# Usage

## コンテナに入る
```
docker exec -it voicebox sh
```

## テキストファイルを変換
```
docker exec -it voicevox /bin/bash -c "cd /work && sh convert.sh scrum.txt"
```

# Note
* [Hiroshiba/voicevox_engine - Github](https://github.com/Hiroshiba/voicevox_engine)

# Author
* [こぴぺたん](https://twitter.com/c_a_p_engineer)

# License
[MIT license](https://en.wikipedia.org/wiki/MIT_License).
