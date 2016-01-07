# name: xbuild
# version: 0.1.0
FROM centos:7
MAINTAINER LorenzoP <lorenzo@poixson.com>

RUN yum update -y
# RUN yum groupinstall -y Development\ Tools --setopt=group_package_types=mandatory,default,optional
RUN yum install -y http://yum.poixson.com/latest.rpm
RUN yum install -y epel-release webtatic-release
RUN yum install -y     \
	perl perl-xml  \
	git subversion \
	shellscripts   \
	supervisor     \
	nginx18        \
	php56w php56w-cli php56w-fpm php56w-xml php56w-gd

RUN echo 'daemon off;' >> /etc/nginx/nginx.conf
COPY ./etc/supervisord.conf     /etc/supervisord.conf
ADD  ./etc/supervisord.d/*.ini  /etc/supervisord.d/

VOLUME /data

EXPOSE 80/tcp
ENTRYPOINT /usr/bin/supervisord -c /etc/supervisord.conf
