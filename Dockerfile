FROM ubuntu:trusty

MAINTAINER Ali <ali@praqma.net>

WORKDIR /data
EXPOSE 4000
RUN apt-get update \
	&& apt-get install -y apt-utils \
	&& apt-get install -y curl gcc \
	&& curl -sL https://deb.nodesource.com/setup | bash - \
	&& apt-get install -y ruby ruby-dev make nodejs

RUN gem install json rdiscount --no-ri --no-rdoc
RUN gem install jekyll --no-ri --no-rdoc

RUN apt-get update
RUN apt-cache showpkg linkchecker
RUN apt-get install -y linkchecker

COPY ./entry.sh /
COPY ./help.txt /
ENTRYPOINT ["/entry.sh"]
