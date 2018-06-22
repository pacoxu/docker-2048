FROM alpine:latest

ARG DAO_COMMIT_SHA

ENV GIT_SHA $DAO_COMMIT_SHA
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
