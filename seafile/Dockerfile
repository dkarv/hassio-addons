ARG BUILD_FROM="seafileltd/seafile-mc:12.0.9"
FROM $BUILD_FROM

ARG BASHIO_VERSION="v0.16.3"
RUN curl -J -L -o /tmp/bashio.tar.gz "https://github.com/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && apt-get install -y jq

# For local development
# COPY dev/options.json /tmp/.bashio/addons.self.options.config.cache

COPY homeassistant.sh /scripts/homeassistant.sh

CMD ["/scripts/homeassistant.sh"]
