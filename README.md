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
## 複数ファイルを一括変換
1. `work/target/` に`hoge.txt`を入れる ※`.txt` ファイルであれば自動的に変換してくれます
2. `docker exec -it voicevox /bin/bash -c "cd /work && sh target.sh"` を実行
5. 完了したら `work/complete` に `hoge.txt` が移動し、 `hoge.txt.wav` ファイルコミットされます

## CIで自動変換

1. ブランチを `convert/hoge` で作成 ※hogeは好きな名前で
2. `work/target/` に`hoge.txt`を入れる ※`.txt` ファイルであれば自動的に変換してくれます。
3. コミット
4. CI が走る
5. 完了したら `work/complete` に `hoge.txt` が移動し、 `hoge.txt.wav` ファイルコミットされます

### 注意点
Gitのファイルサイズに引っかかったら `.github/workflows/convert.yml` を改修して完了時にSlackにファイルをアップするなど改良を行ってください。

# Note
* [Hiroshiba/voicevox_engine - Github](https://github.com/Hiroshiba/voicevox_engine)

# Tool
* [wav → mp3 ファイル変換](https://online-audio-converter.com/ja/)
* [mp3 → mp4 変換](https://www.oneimagevideo.com/)


# Author
* [こぴぺたん](https://twitter.com/c_a_p_engineer)

# License
[MIT license](https://en.wikipedia.org/wiki/MIT_License).
