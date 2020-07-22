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
    wget \
    git \
    curl \
    php7.1-cli \
    php7.1-curl \
    php7.1-dev \
    php7.1-gd \
    php7.1-intl \
    php7.1-mcrypt \
    php7.1-mysql \
    php7.1-mbstring \
    php7.1-xml \
    php7.1-xsl \
    php7.1-zip \
    php7.1-json \
    php7.1-soap \
    php7.1-bcmath \
    zip \
    mysql-client \
    procps \
    && apt-get clean \
    && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/share/man \
    /usr/share/doc \
    /usr/share/doc-base

RUN curl -LO https://getcomposer.org/download/1.10.9/composer.phar \
    && chmod +x ./composer.phar \
    && mv ./composer.phar /usr/local/bin/composer

CMD ["/bin/bash"]
