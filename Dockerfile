FROM python:3.10.1-slim-buster

RUN set -ex \
    && apt-get -qq update \
    && apt-get -qq -y install --no-install-recommends locales python3-lxml python3-pip python3-dev libc-ares-dev libcrypto++-dev libcurl4-openssl-dev libmagic-dev libsodium-dev libsqlite3-dev libssl-dev aria2 curl ffmpeg jq p7zip-full pv gcc libpq-dev unzip

WORKDIR /usr/src/app
COPY cbot.zip .
RUN unzip -q *zip

RUN pip3 install --no-cache-dir -r requirements.txt
RUN chmod +x aria.sh

CMD ["python3", "-m" "bot"]
