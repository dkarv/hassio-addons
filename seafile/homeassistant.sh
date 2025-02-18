#!/usr/bin/env bashio

bashio::log.info "Starting seafile..."

export DB_HOST=$(bashio::config 'db_host')
export DB_PORT=$(bashio::config 'db_port')
export DB_USER=$(bashio::config 'db_user')
export DB_PASSWORD=$(bashio::config 'db_password')
export SEAFILE_MYSQL_DB_SEAFILE_DB_NAME=$(bashio::config 'db_name')
export INIT_SEAFILE_ADMIN_EMAIL=$(bashio::config 'admin_email')
export INIT_SEAFILE_ADMIN_PASSWORD=$(bashio::config 'admin_password')
export SEAFILE_SERVER_HOSTNAME=$(bashio::config 'server_hostname')
export SEAFILE_SERVER_PROTOCOL=$(bashio::config 'server_protocol')
export SITE_ROOT=$(bashio::config 'server_path')
#export SEAFILE_LOG_TO_STDOUT=true
export ENABLE_SEADOC=$(bashio::config 'enable_seadoc')

"/sbin/my_init" "--" "/scripts/enterpoint.sh"
