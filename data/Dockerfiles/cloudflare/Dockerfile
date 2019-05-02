FROM alpine:3.9

COPY cloudflare.sh /cloudflare.sh
COPY crontab /var/spool/cron/crontabs/root

RUN apk add --update bash jq curl && rm -rf /var/cache/apk/* && chmod +x /cloudflare.sh

CMD /cloudflare.sh && test -z "$RUNONCE" && crond -f
