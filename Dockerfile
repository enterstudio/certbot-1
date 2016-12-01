FROM ubuntu:trusty
ENV TERM=xterm

RUN apt-get update && apt-get install -y wget
RUN wget -O /usr/local/bin/certbot-auto https://dl.eff.org/certbot-auto && chmod +x /usr/local/bin/certbot-auto

# Get certbot bootstrapped, but do nothing
RUN certbot-auto certonly --non-interactive || true

ENTRYPOINT ["certbot-auto", "--no-self-upgrade"]
