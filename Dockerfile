FROM ubuntu:trusty

MAINTAINER Claus Schneider <cls@praqma.net>

WORKDIR /linkchecker
EXPOSE 4000

RUN apt-get update
RUN apt-cache showpkg linkchecker
RUN apt-get install -y linkchecker


#ENTRYPOINT ["linkchecker"]
