#!/bin/sh

#
#if [[ -ne /etc/ppp/chap-secrets ]]
#then
#  echo "" > /etc/ppp/chap-secrets
#fi

if [ ! -z "$PPTP_USERNAME" ] && [ ! -z "$PPTP_PASSWORD" ]
then
  echo "$PPTP_USERNAME * $PPTP_PASSWORD *" >> /etc/ppp/chap-secrets
fi
