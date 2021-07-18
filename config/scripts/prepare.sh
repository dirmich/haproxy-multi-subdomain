certbot --text --server https://acme-v02.api.letsencrypt.org/directory --authenticator certbot-pdns:auth certonly -d oldtv.cf -d *.oldtv.cf
certbot --text --server https://acme-v02.api.letsencrypt.org/directory --authenticator certbot-pdns:auth certonly -d kakaolab.ml -d *.kakaolab.ml
certbot --text --server https://acme-v02.api.letsencrypt.org/directory --authenticator certbot-pdns:auth certonly -d arisoo.ml -d *.arisoo.ml
certbot --text --server https://acme-v02.api.letsencrypt.org/directory --authenticator certbot-pdns:auth certonly -d margin.ga -d *.margin.ga

certbot --text --server https://acme-v02.api.letsencrypt.org/directory --authenticator certbot-pdns:auth certonly -d lab.highmaru.com -d *.lab.highmaru.com
