ARG VOICEVOX_VERSION=cpu-ubuntu20.04-latest

FROM hiroshiba/voicevox_engine:${VOICEVOX_VERSION}
RUN apt update && apt install curl

WORKDIR ${APP_CODE_PATH_CONTAINER}