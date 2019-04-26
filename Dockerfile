FROM debian:stretch

MAINTAINER Giuseppe Morelli <info@giuseppemorelli.net>

RUN apt-get -y update \
    && apt-get -y install \
    wget \
    git \
    curl \
    php7.0-cli \
    php7.0-curl \
    php7.0-dev \
    php7.0-gd \
    php7.0-intl \
    php7.0-mcrypt \
    php7.0-mysql \
    php7.0-mbstring \
    php7.0-xml \
    php7.0-xsl \
    php7.0-zip \
    php7.0-json \
    php7.0-soap \
    php7.0-bcmath \
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
    && mv ./composer.phar /usr/local/bin/composer

CMD ["/bin/bash"]