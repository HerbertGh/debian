FROM ubuntu:latest

MAINTAINER secnot@sina.com

ADD start.sh /start.sh


EXPOSE 22

CMD ["/start.sh"]
