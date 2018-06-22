FROM alpine:latest

# Daocloud Service 默认带了构建参数 DAO_COMMIT_SHA， 是 git 的 sha， 相当于 git rev-parse HEAD 的结果。
ARG DAO_COMMIT_SHA

ENV GIT_SHA $DAO_COMMIT_SHA
RUN env
MAINTAINER alex <alexwhen@gmail.com> 

RUN apk --update add nginx

COPY 2048 /usr/share/nginx/html

# 由于.git 被 DCS 先删除了，安装 git 并不能获取到什么信息。
#RUN apk --update add git
# COPY .git 是不会成功的， DCS 自动删除了 .git, 只保留了代码本身。
#COPY .git /root/.git
#RUN git rev-parse HEAD

COPY . /root
WORKDIR /root
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
