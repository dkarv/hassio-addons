ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.19
FROM $BUILD_FROM

# Setup base
RUN apk add --no-cache \
    mariadb-client

# Download restic
ARG RESTIC_VERSION=0.18.0
RUN PLATFORM=$(arch) && if [ "$PLATFORM" = "amd64" ]; then ARCH=amd64; elif [ "$PLATFORM" = "aarch64" ]; then ARCH=arm64; elif [ "$PLATFORM" = "arm64" ]; then ARCH=arm64; else ARCH=amd64; fi \
    && curl -sL "https://github.com/restic/restic/releases/download/v${RESTIC_VERSION}/restic_${RESTIC_VERSION}_linux_${ARCH}.bz2" \
    | bzcat -d > /usr/bin/restic && \
    chmod +x /usr/bin/restic

# For local development
COPY dev/options.json /tmp/.bashio/addons.self.options.config.cache

COPY homeassistant.sh /homeassistant.sh

ENTRYPOINT ["/homeassistant.sh"]
