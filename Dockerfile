FROM caddy:2.10.2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2

# Update APK-Index und Installation der gewünschten Pakete
RUN apk update && apk add --no-cache nano bash curl

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
