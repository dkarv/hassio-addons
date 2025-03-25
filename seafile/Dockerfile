ARG BUILD_FROM="seafileltd/seafile-mc:12.0.11"
FROM $BUILD_FROM

ARG BASHIO_VERSION="v0.16.3"
RUN curl -J -L -o /tmp/bashio.tar.gz "https://github.com/hassio-addons/bashio/archive/${BASHIO_VERSION}.tar.gz" \
    && mkdir /tmp/bashio \
    && tar zxvf /tmp/bashio.tar.gz --strip 1 -C /tmp/bashio \
    && mv /tmp/bashio/lib /usr/lib/bashio \
    && ln -s /usr/lib/bashio/bashio /usr/bin/bashio \
    && apt-get install -y jq

# For local development
# COPY dev/options.json /tmp/.bashio/addons.self.options.config.cache

RUN sed -i "s/db_user = 'root'/db_user = get_conf('DB_ROOT_USER', 'root')/" /scripts/utils.py \
    && sed -i "s/self.root_conn = self.check_mysql_user('root', password)/self.root_conn = self.check_mysql_user('seafile', password)/" /opt/seafile/seafile-server-*/setup-seafile-mysql.py \
    && sed -i "s/db_config.root_conn.close()/if not db_config.root_conn == '': db_config.root_conn.close()/" /opt/seafile/seafile-server-*/setup-seafile-mysql.py \
    && sed -i "s/'MYSQL_ROOT_PASSWD': get_conf('DB_ROOT_PASSWD', ''),/'MYSQL_ROOT_PASSWD': get_conf('DB_ROOT_PASSWD', ''),\n        'USE_EXISTING_DB': '1'/" /scripts/bootstrap.py


COPY homeassistant.sh /scripts/homeassistant.sh

CMD ["/scripts/homeassistant.sh"]
