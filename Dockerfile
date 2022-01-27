FROM ubuntu:latest

MAINTAINER secnot@sina.com

ADD start.sh /start.sh

RUN mkdir -p /var/run/sshd && \
	echo 'root:password' | chpasswd && \
	echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list && \
	echo "deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list && \
	echo "deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
	echo "deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list && \
	echo "deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list && \
	echo "deb http://debian.ustc.edu.cn/ubuntu/ trusty main multiverse restricted universe" >> /etc/apt/sources.list && \
	echo "deb http://debian.ustc.edu.cn/ubuntu/ trusty-backports main multiverse restricted universe" >> /etc/apt/sources.list && \
	echo "deb http://debian.ustc.edu.cn/ubuntu/ trusty-proposed main multiverse restricted universe" >> /etc/apt/sources.list && \
	echo "deb http://debian.ustc.edu.cn/ubuntu/ trusty-security main multiverse restricted universe" >> /etc/apt/sources.list && \
	echo "deb http://debian.ustc.edu.cn/ubuntu/ trusty-updates main multiverse restricted universe" >> /etc/apt/sources.list && \
	echo "deb-src http://debian.ustc.edu.cn/ubuntu/ trusty main multiverse restricted universe" >> /etc/apt/sources.list && \
	echo "deb-src http://debian.ustc.edu.cn/ubuntu/ trusty-backports main multiverse restricted universe" >> /etc/apt/sources.list && \
	echo "deb-src http://debian.ustc.edu.cn/ubuntu/ trusty-proposed main multiverse restricted universe" >> /etc/apt/sources.list && \
	echo "deb-src http://debian.ustc.edu.cn/ubuntu/ trusty-security main multiverse restricted universe" >> /etc/apt/sources.list && \
	echo "deb-src http://debian.ustc.edu.cn/ubuntu/ trusty-updates main multiverse restricted universe" >> /etc/apt/sources.list && \
	apt-get update && 

EXPOSE 22

CMD ["/start.sh"]
