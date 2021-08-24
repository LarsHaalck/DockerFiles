FROM alpine:3.14

RUN apk add --update --no-cache \
    taskd

EXPOSE 53589

CMD [""]


