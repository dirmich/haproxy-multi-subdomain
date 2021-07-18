# haproxy-multi-subdomain

와일드카드 도메인 인증서 적용

export DOMAIN={domain of wildcard subdomain}
--> export DOMAIN=badat.ga for \*.badat.ga

/opt/scripts/mcerts.sh

여기서 나온 key string을 named의 zone에
\_acme-challenge TXT "\_zUHHwyjoJbZEHzFbxVDdJ1Bjz39i41UJfWJI4HO9bw"

이런 식으로 입력하고 named restart

mcerts.sh 실행이 끝나면 해당 도메인의 인증서는 certs/haproxy-{DOMAIN}.pem으로 저장됨

# reset

1. prepare.sh 안에 도메인 설정
2. prepare.sh 실행
3. renew.sh 실행
