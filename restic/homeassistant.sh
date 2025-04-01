#!/usr/bin/env bashio

bashio::log.info "Starting restic backup"

mkdir -p .ssh
bashio::config 'ssh_key' > .ssh/id_rsa
chmod 600 .ssh/id_rsa

export RESTIC_PASSWORD=$(bashio::config 'backup_password')
export RESTIC_REPOSITORY=$(bashio::config 'backup_target')
export RESTIC_HOST="homeassistant"
export BACKUP_DIRECTORIES=$(bashio::config 'backup_directories')
export BACKUP_OPTIONS=$(bashio::config 'backup_options')

if restic cat config >/dev/null 2>&1; then
  bashio::log.info "Found existing restic repository"
else
  bashio::log.info "Initializing new restic repository"
  restic init
fi

# TODO Dump databases

bash -c "$(bashio::config 'before_script')"

restic backup $BACKUP_OPTIONS $BACKUP_DIRECTORIES
