FROM php:7.3-apache

ENV CAS_VERSION=1.3.8
ENV TZ=America/Santo_Domingo

# Setup PHP for GLPI
RUN apt-get update && \
    apt-get install -y \
    zlib1g-dev libpng-dev \
    libicu-dev libldb-dev \
    libldap2-dev libxml2-dev \
    libzip-dev libbz2-dev 

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so \
    && ln -s /usr/lib/x86_64-linux-gnu/liblber.so /usr/lib/liblber.so

RUN docker-php-ext-install mysqli intl ldap opcache xml gd zip exif bz2 xmlrpc

RUN pecl install apcu; \
    docker-php-ext-enable apcu; \
    curl -fsSL -o /tmp/CAS.tgz https://github.com/apereo/phpCAS/releases/download/${CAS_VERSION}/CAS-${CAS_VERSION}.tgz; \
    pear install /tmp/CAS.tgz

RUN apt-get autoremove --purge -y 

RUN rm -rf /var/lib/apt/lists/*


COPY . /var/www/html/glpi

RUN chown -R www-data:www-data /var/www

CMD [ "apache2-foreground" ]

