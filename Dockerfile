FROM alpine:3.18.4

RUN apk add --no-cache bind-tools smokeping lighttpd curl fping sudo traceroute tcptraceroute openrc tzdata ssmtp \
    && ln -sfn /usr/share/zoneinfo/America/New_York /etc/localtime \
    && ln -s /usr/share/webapps/smokeping/smokeping.cgi /var/www/localhost/htdocs/smokeping.cgi \
    && ln -s /usr/share/webapps/smokeping/css /var/www/localhost/htdocs/css \
    && ln -s /usr/share/webapps/smokeping/js /var/www/localhost/htdocs/js \
    && ln -s /var/lib/smokeping/images /var/www/localhost/htdocs/img \
    && chmod o+w /var/lib/smokeping/images \
    && rm -fr /etc/smokeping \
    && chmod a+s /usr/bin/traceroute /usr/bin/tcptraceroute /usr/sbin/fping \
    && mv /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.orig \
    && fc-cache -rsv

COPY run.sh /app/run.sh
COPY ./etc/lighttpd.conf /etc/lighttpd/lighttpd.conf

EXPOSE 80

VOLUME /data

ENTRYPOINT [ "/app/run.sh" ]
