#!/usr/bin/env sh

if [ ! -e "/etc/ssmtp/ssmtp.conf" ]; then
    echo "Initializing ssmtp.conf..."
    echo "root={SSMTP_ROOT_EMAIL:=postmaster}" >> /etc/ssmtp/ssmtp.conf
    echo "mailhub=${SSMTP_SMTP_SERVER:=mailhub}" >> /etc/ssmtp/ssmtp.conf
    echo "rewriteDomain=${SSMTP_REWRITE_DOMAIN:=localhost}" >> /etc/ssmtp/ssmtp.conf
    echo "hostname=\"${SSMTP_REWRITE_DOMAIN:=localhost}\"" >> /etc/ssmtp/ssmtp.conf
fi

/usr/bin/smokeping --config="/etc/smokeping/config"
exec 3>&1
chmod o+w /dev/fd/3
/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf

echo "why are you here?"
while true; do sleep 60; done
