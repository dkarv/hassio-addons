#!/usr/bin/env bashio

bashio::log.info "Starting restic backup"

# Dump databases


export RESTIC_PASSWORD=$(bashio::config 'backup_password')
export RESTIC_REPOSITORY=$(bashio::config 'backup_target')
export RESTIC_HOST="homeassistant"
bashio::log.info "Directories: $(bashio::config 'folders')"

restic --help
restic backup test
