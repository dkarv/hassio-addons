ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.19
FROM $BUILD_FROM

# Setup base
RUN apk add --no-cache \
    mariadb-client

# Download restic
ARG RESTIC_VERSION=0.18.0
ARG BUILD_ARCH=amd64
RUN curl -L "https://github.com/restic/restic/releases/download/v${RESTIC_VERSION}/restic_${RESTIC_VERSION}_linux_${BUILD_ARCH}.bz2"
RUN bzcat
RUN curl -sL "https://github.com/restic/restic/releases/download/v${RESTIC_VERSION}/restic_${RESTIC_VERSION}_linux_${BUILD_ARCH}.bz2" \
    | bzcat -d > /usr/bin/restic && \
    chmod +x /usr/bin/restic
    
# For local development
# COPY dev/options.json /tmp/.bashio/addons.self.options.config.cache

COPY homeassistant.sh /homeassistant.sh

ENTRYPOINT ["/homeassistant.sh"]
