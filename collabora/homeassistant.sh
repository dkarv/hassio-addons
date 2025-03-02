#!/usr/bin/env bashio

bashio::log.info "Exporting configuration..."

export DONT_GEN_SSL_CERT="true"
export username="$(bashio::config 'admin_username')"
export password="$(bashio::config 'admin_password')"
export server_name="$(bashio::config 'server_hostname')"
export dictionaries="$(bashio::config 'dictionaries')"
export extra_params="$(bashio::config 'extra_params')"

bashio::log.info "Starting collabora"

/start-collabora-online.sh
