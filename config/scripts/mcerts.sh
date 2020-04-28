#!/bin/sh

if [ -n "$DOMAIN" ]; then
    certbot certonly --manual \
	--preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory \
	--manual-public-ip-logging-ok \
	-d *."$DOMAIN" \
        --keep --expand --agree-tos --email "$EMAIL" \
        || exit 1

    mkdir -p /etc/haproxy/certs
    for site in `ls -1 /etc/letsencrypt/live | grep -v ^README$`; do
        cat /etc/letsencrypt/live/$site/privkey.pem \
          /etc/letsencrypt/live/$site/fullchain.pem \
          | tee /etc/haproxy/certs/haproxy-"$site".pem >/dev/null
    done
fi

exit 0