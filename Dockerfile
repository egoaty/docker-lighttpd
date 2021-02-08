ARG DISTRO=alpine:3
FROM $DISTRO

RUN apk add --no-cache tzdata lighttpd

COPY root/ /

EXPOSE 80/tcp

CMD /run.sh


