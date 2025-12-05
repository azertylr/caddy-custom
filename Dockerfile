FROM caddy:2.10.2-builder AS builder

RUN xcaddy build \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http \
    --with github.com/caddy-dns/ovh \
    --with github.com/oltdaniel/caddy-ipinfo-free

FROM caddy:2.10.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
