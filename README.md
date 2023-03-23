# docker-smokeping

Everything you need to run [smokeping](https://oss.oetiker.ch/smokeping/) in a docker container using docker compose.

## Usage

```yaml
version: "3"

services:
  smokeping:
    image: ghcr.io/sashkab/docker-smokeping/docker-smokeping:latest
    hostname: smokeping.domain
    environment:
      - SSMTP_ROOT_EMAIL=smokeping@domain
      - SSMTP_SMTP_SERVER=smtp.domain
      - SSMTP_REWRITE_DOMAIN=smokeping.domain
    volumes:
      - smokeping_data:/data
      - ./smokeping/smokeping:/etc/smokeping:ro
    ports:
     - "80:80/tcp"
    restart: always

volumes:
  smokeping_data:
```
