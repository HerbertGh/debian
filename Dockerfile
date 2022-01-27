FROM ubuntu:latest

MAINTAINER secnot@sina.com

ADD start.sh /start.sh
RUN mkdir -p /var/run/sshd && echo 'root:password' | chpasswd && apt-get update && apt-get install -y openssh-server &&
EXPOSE 22

CMD ["/start.sh"]
