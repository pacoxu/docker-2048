FROM alpine:latest

ARG GIT_SHA
ARG GIT_SHA1
ARG GIT_SHA2

ENV GIT_SHA $GIT_SHA
RUN env
MAINTAINER alex <alexwhen@gmail.com> 

RUN apk --update add nginx git

COPY 2048 /usr/share/nginx/html
COPY .git /root/.git
COPY . /root
WORKDIR /root
RUN git rev-parse HEAD
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
