FROM ubuntu:latest
MAINTAINER Olivier Lalonde <olalonde@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pptpd iptables

COPY ./etc/pptpd.conf /etc/pptpd.conf
COPY ./etc/ppp/pptpd-options /etc/ppp/pptpd-options

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

COPY gen-chap-secrets.sh /gen-chap-secrets.sh
RUN chmod 0700 /gen-chap-secrets.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]
