#!/usr/bin/env bashio

bashio::log.info "Exporting configuration..."

bashio::config 'db_host' > /etc/container_environment/DB_HOST
bashio::config 'db_port' > /etc/container_environment/DB_PORT
bashio::config 'db_user' > /etc/container_environment/DB_USER
bashio::config 'db_password' > /etc/container_environment/DB_PASSWORD
bashio::config 'db_name' > /etc/container_environment/SEAFILE_MYSQL_DB_SEAFILE_DB_NAME
bashio::config 'admin_email' > /etc/container_environment/INIT_SEAFILE_ADMIN_EMAIL
bashio::config 'admin_password' > /etc/container_environment/INIT_SEAFILE_ADMIN_PASSWORD
bashio::config 'server_hostname' > /etc/container_environment/SEAFILE_SERVER_HOSTNAME
bashio::config 'server_protocol' > /etc/container_environment/SEAFILE_SERVER_PROTOCOL
bashio::config 'server_path' > /etc/container_environment/SITE_ROOT
#echo "true" > /etc/container_environment/SEAFILE_LOG_TO_STDOUT=true
bashio::config 'enable_seadoc' > /etc/container_environment/ENABLE_SEADOC

bashio::log.info "Starting seafile"

"/sbin/my_init" "--" "/scripts/enterpoint.sh"
