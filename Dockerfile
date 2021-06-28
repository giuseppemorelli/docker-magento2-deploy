FROM debian:stretch

MAINTAINER Giuseppe Morelli <info@giuseppemorelli.net>

RUN apt-get -y update \
    && apt-get -y install \
    apt-transport-https \
    ca-certificates \
    wget

RUN wget -O "/etc/apt/trusted.gpg.d/php.gpg" "https://packages.sury.org/php/apt.gpg" \
    && sh -c 'echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list'

RUN apt-get -y update \
    && apt-get -y install \
    git \
    curl \
    php7.3 \
    php7.3-common \
    php7.3-cli \
    php7.3-curl \
    php7.3-dev \
    php7.3-gd \
    php7.3-intl \
    php7.3-mysql \
    php7.3-mbstring \
    php7.3-xml \
    php7.3-xsl \
    php7.3-zip \
    php7.3-json \
    php7.3-xdebug \
    php7.3-soap \
    php7.3-bcmath \
    php7.3-imap \
    zip \
    mysql-client \
    && apt-get clean \
    && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/share/man \
    /usr/share/doc \
    /usr/share/doc-base

RUN curl -LO https://getcomposer.org/composer.phar \
    && chmod +x ./composer.phar \
    && mv ./composer.phar /usr/local/bin/composer \
    && /usr/local/bin/composer self-update --1

CMD ["/bin/bash"]
