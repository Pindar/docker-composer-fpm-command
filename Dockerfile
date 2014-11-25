FROM ubuntu:14.04
MAINTAINER Simon Dittlmann

ENV HOME /root

RUN apt-get update -qq && \
	apt-get install -y -qq git curl && \
	apt-get -y clean

# install FPM
RUN apt-get install -y -qq \
	php5-fpm \
	php5-cli \
	php5-curl \
	php5-mcrypt \
	mcrypt \
	php5-json \
	php5-mysql \
	php5-gd && \
	apt-get -y clean

# enable modules
RUN php5enmod mcrypt curl json mysql mysqli pdo_mysql readline gd mcrypt pdo

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin

# Display Composer version information
RUN composer --version

# Set up the application directory.
VOLUME ["/app"]
WORKDIR /app

