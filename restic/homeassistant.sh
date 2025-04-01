#!/usr/bin/env bashio

bashio::log.info "Starting restic backup"


bashio::log.info "Running before_script"
bash -c "$(bashio::config 'before_script')"


bashio::log.info "Setting up SSH key"
mkdir -p .ssh
bashio::config 'ssh_key' > .ssh/id_rsa
chmod 600 .ssh/id_rsa


bashio::log.info "Exporting environment variables"
export RESTIC_PASSWORD=$(bashio::config 'backup_password')
export RESTIC_REPOSITORY=$(bashio::config 'backup_target')
export RESTIC_HOST="homeassistant"
export BACKUP_DIRECTORIES=$(bashio::config 'backup_directories')
export BACKUP_OPTIONS=$(bashio::config 'backup_options')


bashio::log.info "Checking repository"
if restic cat config >/dev/null 2>&1; then
  bashio::log.info "Found existing restic repository"
else
  bashio::log.info "Initializing new restic repository"
  restic init
fi


bashio::log.info "Dumping databases"
# TODO Dump databases


bashio::log.info "Starting backup"
restic backup $BACKUP_OPTIONS $BACKUP_DIRECTORIES
