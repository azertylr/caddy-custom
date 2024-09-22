FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/caddy-dns/ovh

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
