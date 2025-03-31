ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.19
FROM $BUILD_FROM

# Setup base
RUN apk add --no-cache \
    mariadb-client

# Download restic
ARG RESTIC_VERSION=0.18.0
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then ARCHITECTURE=amd64; elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then ARCHITECTURE=arm; elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then ARCHITECTURE=aarch64; else ARCHITECTURE=amd64; fi \
    && curl -sL "https://github.com/restic/restic/releases/download/v${RESTIC_VERSION}/restic_${RESTIC_VERSION}_linux_${ARCHITECTURE}.bz2" \
    | bzcat -d > /usr/bin/restic && \
    chmod +x /usr/bin/restic

# For local development
# COPY dev/options.json /tmp/.bashio/addons.self.options.config.cache

COPY homeassistant.sh /homeassistant.sh

ENTRYPOINT ["/homeassistant.sh"]
