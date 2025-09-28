FROM ubuntu:latest
LABEL authors="daniilogorodnikov"

ENTRYPOINT ["top", "-b"]