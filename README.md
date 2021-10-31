# Docker VOICEBOX環境

# Requirement
* [docker](https://www.docker.com/)

# Install
`.env.example` をコピー `.env` を作成。
各種設定値を修正。

Docker起動
```
docker-compose up -d --build
```

コンテナに入る
```
docker exec -it voicebox sh
```

# Note
* [Hiroshiba/voicevox_engine - Github](https://github.com/Hiroshiba/voicevox_engine)

# Author
* [こぴぺたん](https://twitter.com/c_a_p_engineer)

# License
[MIT license](https://en.wikipedia.org/wiki/MIT_License).
