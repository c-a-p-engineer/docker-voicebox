ARG VOICEVOX_VERSION=cpu-ubuntu20.04-latest

FROM hiroshiba/voicevox_engine:${VOICEVOX_VERSION}
RUN apt update && apt install curl
RUN apt install -y sox
