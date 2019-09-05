FROM scolagreco/alpine-base:v3.9.2

ADD files /root/

RUN apk add --update --no-cache \
		ca-certificates \
		curl \
		tar \
		xz \
		gzip \
		imagemagick \
		libressl \
		zlib \
		libxml2 \
		musl \		
		\
    && apk add --update --no-cache \
		php7 \
		php7-fpm \
		php7-mysqli \
		php7-json \
		php7-openssl \
		php7-curl \
                php7-zlib \
		php7-xml \
		php7-phar \
		php7-intl \
		php7-dom \
		php7-xmlreader \
		php7-ctype \
    		php7-mbstring \
		php7-gd \
		\
    && apk add --update --no-cache \
		php7-intl \
		php7-pdo_mysql \
		php7-gmagick \
		php7-pspell \
		php7-fileinfo \
		php7-opcache \
		php7-ldap \
		php7-pdo_pgsql \
		php7-pgsql \
		php7-pdo_odbc \
		php7-zip \
		php7-mcrypt \
		php7-soap \
		php7-apcu \
		php7-session \
                php7-simplexml \
		\
    && apk add --update --no-cache \
		nginx \
		supervisor \
		file \
		make \
		\
    && mkdir -p /run/nginx/tmp \
    && mv /root/supervisord.conf /etc/supervisord.conf \
    && mv /root/nginx.conf /etc/nginx/nginx.conf \
    && mv /root/default.conf /etc/nginx/conf.d/default.conf \
    && mv /root/php.ini /etc/php7/php.ini \
    && mv /root/php-fpm.conf /etc/php7/php-fpm.conf \
    && mv /root/www.conf /etc/php7/php-fpm.d/www.conf \
    && rm -Rf /var/www/* \
    && mv /root/info.php /var/www/index.php \
    && mv /root/404.html /opt/ \
    && mv /root/50x.html /opt/ \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /var/www

EXPOSE 80 443

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

# Metadata params
ARG BUILD_DATE
ARG VERSION
ARG VCS_URL="https://github.com/scolagreco/alpine-nginx-php.git"
ARG VCS_REF

# Metadata
LABEL maintainer="Stefano Colagreco <stefano@colagreco.it>" \
        org.label-schema.name="Alpine con NGINX, PHP7 e PHP7-FPM" \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.version=$VERSION \
        org.label-schema.vcs-url=$VCS_URL \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.description="Docker Image di Alpine con installato NGINX, PHP7 e PHP7-FPM da repository Alpine. NGINX utilizza PHP7-FPM."
