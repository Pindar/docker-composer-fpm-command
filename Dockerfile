FROM ubuntu:14.04
MAINTAINER Simon Dittlmann

ENV HOME /root

RUN apt-get update -qq && \
	apt-get install -y -qq git curl && \
	apt-get -y clean

# install FPM
RUN apt-get install -y -qq php5-fpm php5-cli php5-curl php5-mcrypt mcrypt && \
	apt-get -y clean

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin

WORKDIR /srv