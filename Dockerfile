FROM fcojean/l2tp-ipsec-vpn-server

COPY ./run.sh /run.sh
RUN chmod 755 /run.sh

EXPOSE 500/udp 4500/udp
VOLUME ["/lib/modules"]
CMD ["/run.sh"]
