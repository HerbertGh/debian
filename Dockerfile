FROM ubuntu:latest

MAINTAINER secnot@sina.com

ADD start.sh /start.sh
RUN mkdir -p /var/run/sshd && 
RUN echo 'root:password' | chpasswd && 
RUN apt-get update &&
RUN apt-get install -y openssh-server &&
RUN chmod 755 /start.sh

EXPOSE 22

CMD ["/start.sh"]
