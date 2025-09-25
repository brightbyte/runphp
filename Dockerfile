FROM rimelek/php:${VERSION}-fpm
WORKDIR /app

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN useradd app
RUN mkdir -p /home/app
RUN chown app:app /home/app

RUN apt-get update
RUN apt-get install -y unzip
RUN apt-get install -y curl
RUN apt-get install -y vim-tiny
RUN re-php-ext-curl
RUN re-php-ext-zip
RUN re-php-ext-xml


ENTRYPOINT ["/bin/bash"]
