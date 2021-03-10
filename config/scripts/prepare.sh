certbot --text --server https://acme-v02.api.letsencrypt.org/directory --authenticator certbot-pdns:auth certonly -d badat.ga -d *.badat.ga

certbot --text --server https://acme-v02.api.letsencrypt.org/directory --authenticator certbot-pdns:auth certonly -d lab.highmaru.com -d *.lab.highmaru.com
