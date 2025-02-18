#!/usr/bin/env bashio

bashio::log.info "Starting seafile..."

"/sbin/my_init" "--" "/scripts/enterpoint.sh"
