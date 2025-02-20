#!/usr/bin/env bashio

bashio::log.info "Exporting configuration..."

# TODO No idea why directly piping does not work
# bashio::config 'db_host' > /etc/container_environment/DB_HOST
echo "$(bashio::config 'db_host')" > /etc/container_environment/DB_HOST
echo "$(bashio::config 'db_port')" > /etc/container_environment/DB_PORT
echo "$(bashio::config 'db_user')" > /etc/container_environment/DB_USER
echo "$(bashio::config 'db_password')" > /etc/container_environment/DB_PASSWORD
echo "$(bashio::config 'db_name')" > /etc/container_environment/SEAFILE_MYSQL_DB_SEAFILE_DB_NAME
echo "$(bashio::config 'admin_email')" > /etc/container_environment/INIT_SEAFILE_ADMIN_EMAIL
echo "$(bashio::config 'admin_password')" > /etc/container_environment/INIT_SEAFILE_ADMIN_PASSWORD
echo "$(bashio::config 'server_hostname')" > /etc/container_environment/SEAFILE_SERVER_HOSTNAME
echo "$(bashio::config 'server_protocol')" > /etc/container_environment/SEAFILE_SERVER_PROTOCOL
echo "$(bashio::config 'server_path')" > /etc/container_environment/SITE_ROOT
# echo "true" > /etc/container_environment/SEAFILE_LOG_TO_STDOUT
echo "$(bashio::config 'enable_seadoc')" > /etc/container_environment/ENABLE_SEADOC

bashio::log.info "Starting seafile"

"/sbin/my_init" "--" "/scripts/enterpoint.sh"
