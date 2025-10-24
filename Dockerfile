FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    bash \
    fortune-mod \
    cowsay \
    netcat-openbsd \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the wisecow script (ensure wisecow.sh exists in repo root)
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

EXPOSE 4499

CMD ["/app/wisecow.sh"]