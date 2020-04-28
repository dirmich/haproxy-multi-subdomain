FROM haproxy:2.1-alpine

# ENTRYPOINT ["/opt/scripts/prepare-entrypoint.sh"]
# CMD haproxy -- /etc/haproxy/*.cfg

# # The port listening in `www` container
# ENV PORT=80 \
#     MODE=NORMAL \
#     # Odoo mode special variables
#     ODOO_LONGPOLLING_PORT=8072 \
#     # Use `FORCE` or `REMOVE`
#     WWW_PREFIX=REMOVE \
#     # Use `false` to ask for real certs
#     STAGING=true \
#     # Use `true` to continue on cert fetch failure
#     CONTINUE_ON_CERTONLY_FAILURE=false \
#     # Fill your data here
#     EMAIL=contact@highmaru.com \
#     DOMAINS=*.lab.highmaru.com \
#     RSA_KEY_SIZE=4096 \
#     # Command to fetch certs at container boot
#     CERTONLY="certbot certonly --http-01-port 80" \
#     # Command to monthly renew certs
#     RENEW="certbot certonly"

# Certbot (officially supported Let's Encrypt client)
# SEE https://github.com/certbot/certbot/pull/4032
# COPY cli.ini certbot.txt /usr/src/
# RUN apk add --no-cache --virtual .certbot-deps \
#         py2-pip \
#         dialog \
#         augeas-libs \
#         libffi \
#         libssl1.0 \
#         wget \
#         ca-certificates \
#         binutils
# RUN apk add --no-cache --virtual .build-deps \
#         python-dev \
#         gcc \
#         linux-headers \
#         openssl-dev \
#         musl-dev \
#         libffi-dev \
#     && pip install --no-cache-dir --require-hashes -r /usr/src/certbot.txt \
#     && apk del .build-deps

# # Cron
# RUN apk add --no-cache dcron
# RUN ln -s /usr/local/bin/renew.sh /etc/periodic/monthly/renew

# # Utils
# RUN apk add --no-cache gettext socat
# RUN mkdir -p /var/lib/haproxy && touch /var/lib/haproxy/server-state
# COPY conf/* /etc/haproxy/
# COPY prepare-entrypoint.sh /
# COPY bin/* /usr/local/bin/

# VOLUME /var/spool/cron/cronstamps /etc/letsencrypt

# Install certbot, supervisor, cron, libnl-utils, net-tools, iptables
RUN apk add --no-cache --update \
    supervisor \
    dcron \
    libnl3-cli \
    net-tools \
    iproute2 \
    certbot \
    openssl \
  && rm -rf /var/cache/apk/*

# Setup Supervisor
RUN mkdir -p /var/log/supervisor
RUN mkdir /opt/scripts
COPY config/scripts/*.sh /opt/scripts/
RUN chmod +x /opt/scripts/*.sh

EXPOSE 80 443 9001

# CMD ["ls","-la","/opt/scripts"]
CMD [ "/opt/scripts/bootstrap.sh" ]