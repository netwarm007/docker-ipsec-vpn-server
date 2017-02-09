FROM ubuntu:zesty
LABEL maintainer Chen, Wenli <chenwenli@chenwenli.com>

RUN \
    apt-get -yqq update \
    && DEBIAN_FRONTEND=noninteractive apt-get -yqq --no-install-recommends install \
        libreswan \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./run.sh /opt/src/run.sh
RUN chmod 755 /opt/src/run.sh

EXPOSE 500/udp 4500/udp

VOLUME ["/lib/modules"]

CMD ["/opt/src/run.sh"]
