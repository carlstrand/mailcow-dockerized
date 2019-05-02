FROM alpine:3.9

ENV ZONE= \
    HOST= \
    EMAIL= \
    API= \
    TTL= \
    PROXY= \
    DEBUG= \
    FORCE_CREATE= \
    RUNONCE=

RUN apt-get update && apt-get install -y bash jq curl \
    && rm -rf /var/cache/apk/* \
    && chmod +x /cloudflare.sh

COPY cloudflare.sh /cloudflare.sh
COPY crontab /var/spool/cron/crontabs/root

CMD /cloudflare.sh && test -z "$RUNONCE" && crond -f
