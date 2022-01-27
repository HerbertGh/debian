FROM ubuntu:latest

ENV SWAN_VER 3.17
ENV DEBIAN_FRONTEND noninteractive

RUN echo 'root:password' | chpasswd && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y openssh-server dnsutils openssl ca-certificates kmod iproute gawk grep sed net-tools iptables && \
    libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev && \
    libcurl4-nss-dev flex bison gcc make libunbound-dev libnss3-tools libevent-dev xl2tpd xmlto jq 

WORKDIR /opt/src
RUN wget -t 3 -T 30 -nv -O "libreswan-${SWAN_VER}.tar.gz" "https://download.libreswan.org/libreswan-${SWAN_VER}.tar.gz" \
    && tar xzf "libreswan-${SWAN_VER}.tar.gz" \
    && rm -f "libreswan-${SWAN_VER}.tar.gz" \
    && cd "libreswan-${SWAN_VER}" \
    && echo "WERROR_CFLAGS =" > Makefile.inc.local \
    && make -s programs \
    && make -s install \
    && rm -rf "/opt/src/libreswan-${SWAN_VER}"

COPY ./run.sh /run.sh
RUN chmod 755 /run.sh

EXPOSE 500/udp 4500/udp

VOLUME ["/lib/modules"]

CMD ["/run.sh"]
