ARG CADDY_VERSION

FROM caddy:${CADDY_VERSION:-2}-builder-alpine AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare

FROM caddy:${CADDY_VERSION:-2}-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

