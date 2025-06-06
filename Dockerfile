FROM caddy:2.10.0-builder AS builder

RUN xcaddy build \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/caddy-dns/ovh \
    --with github.com/oltdaniel/caddy-ipinfo-free

FROM caddy:2.10.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
