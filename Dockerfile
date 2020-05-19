
FROM golang:1.14.3-alpine3.11

EXPOSE 8080

RUN apk add -q --update \
    && apk add -q \
            bash \
            git \
            curl \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /tmp/gotty && \
  GOPATH=/tmp/gotty go get github.com/yudai/gotty && \
  mv /tmp/gotty/bin/gotty /usr/local/bin/ && \
  rm -rf /tmp/gotty /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/sh"]