FROM ubuntu:18.04

WORKDIR /home
VOLUME /data
ENV PATH="/home:${PATH}"

ADD hello_world.c .


RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
    apt-get update && \
    apt-get install build-essential -y && \
    gcc hello_world.c -o hello_world

ENTRYPOINT hello_world && cat /data/name
