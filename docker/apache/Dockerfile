FROM php:5.6-apache

ARG USER
ARG USER_ID

#==============================================================================
# OS Setup
#==============================================================================
# Apt update & upgrade
RUN apt-get -qqy update
RUN apt-get -qqy upgrade

# Locale
ENV LOCALE es_ES.UTF-8
RUN apt-get -qqy install locales
RUN sed -i -e "s/# $LOCALE/$LOCALE/" /etc/locale.gen
RUN echo "LANG=$LOCALE">/etc/default/locale
RUN dpkg-reconfigure --frontend=noninteractive locales
RUN update-locale LANG=$LOCALE

# Timezone
ENV TZ=Europe/Madrid
RUN echo $TZ | tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN echo "date.timezone = \"$TZ\";" > /usr/local/etc/php/conf.d/timezone.ini

# Vi editor
RUN apt-get -qqy install vim
RUN echo "export TERM=xterm" >> /etc/bash.bashrc

# Git
RUN apt-get -qqy install git

# Sudo
RUN apt-get -qqy install sudo

# Working dir
WORKDIR /var/www/html

#==============================================================================
# LAMP Setup
#==============================================================================
# Composer
RUN apt-get -qqy install zip unzip zlib1g-dev
RUN docker-php-ext-install zip
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
# alias to disable xdebug  when running composer command
# https://getcomposer.org/doc/articles/troubleshooting.md#xdebug-impact-on-composer
RUN mkdir /usr/local/etc/php/conf.d.disabled/
RUN echo 'function composer() { COMPOSER="$(which composer)" || { echo "Could not find composer in path" >&2 ; return 1 ; } && sudo mv /usr/local/etc/php/conf.d/xdebug.ini /usr/local/etc/php/conf.d.disabled/ ; $COMPOSER "$@" ; STATUS=$? ; sudo mv /usr/local/etc/php/conf.d.disabled/xdebug.ini /usr/local/etc/php/conf.d/ ; return $STATUS ; }' >> /etc/bash.bashrc

# add local user
RUN useradd --shell /bin/bash -c "" -u ${USER_ID} -o -m ${USER}
RUN adduser ${USER} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# switch to local user before using composer
USER ${USER}

# prestissimo para acelerar composer
RUN composer global require "hirak/prestissimo:^0.3"

# switch to root after using composer
USER root


# PDO Mysql
RUN docker-php-ext-install pdo pdo_mysql

# opcache
RUN docker-php-ext-install opcache
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=2'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

#xdebug
RUN pecl install xdebug
RUN { \
		echo 'zend_extension=xdebug.so'; \
		echo 'xdebug.remote_enable=on'; \
		echo 'xdebug.remote_connect_back=on'; \
		echo 'xdebug.remote_port=9000'; \
		echo 'xdebug.profiler_enable=off'; \
	} > /usr/local/etc/php/conf.d/xdebug.ini

# Apache
RUN a2enmod rewrite
#RUN a2enmod ssl
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
#COPY ./default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
#RUN a2ensite default-ssl
#RUN a2dissite 000-default
#COPY ./ssl-cert-snakeoil.key /etc/ssl/private/
#COPY ./ssl-cert-snakeoil.pem /etc/ssl/certs/
RUN ln -sf /dev/stdout /var/log/apache2/access.log
RUN ln -sf /dev/stderr /var/log/apache2/error.log

#==============================================================================
# LOCAL TO THIS PROJECT
#==============================================================================
RUN apt-get -qqy install libgmp-dev && \
ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h && \
docker-php-ext-install gmp

# Cleanup some things
RUN apt-get -q autoclean && rm -rf /var/lib/apt/lists/*

