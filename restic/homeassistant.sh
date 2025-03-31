#!/usr/bin/env bashio

bashio::log.info "Starting restic backup"

# TODO Dump databases


export RESTIC_PASSWORD=$(bashio::config 'backup_password')
export RESTIC_REPOSITORY=$(bashio::config 'backup_target')
export RESTIC_HOST="homeassistant"
bashio::log.info "Directories: $(bashio::config 'backup_directories')"
# newline separated

sleep 1000000

restic --help
restic backup test
