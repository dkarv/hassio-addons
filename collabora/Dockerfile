FROM collabora/code:24.04.5.1.1

USER root

ARG BASHIO_VERSION="v0.16.3"
RUN curl -J -L -o /tmp/bashio.tar.gz "https://github.com/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio \
    && whoami \
    && ls -la /usr/lib \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && apt-get update \
    && apt-get install -y jq

COPY homeassistant.sh /homeassistant.sh

USER 100

CMD ["/homeassistant.sh"]
