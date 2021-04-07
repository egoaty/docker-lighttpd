ARG DISTRO=alpine:3
FROM $DISTRO

RUN \
  apk -U upgrade && \
  apk add -U --no-cache tzdata lighttpd && \
  rm -rf /var/cache/apk/*

COPY root/ /

EXPOSE 80/tcp

CMD /run.sh


