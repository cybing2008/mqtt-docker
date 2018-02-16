#######################
# MQTT for Dockerfile #
#######################
FROM alpine:latest
MAINTAINER ilee

RUN set -ex && \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add --no-cache bash && \
    apk add --no-cache mosquitto mosquitto-clients

EXPOSE 1883

ENTRYPOINT ["mosquitto"]
