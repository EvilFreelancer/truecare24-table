FROM evilfreelancer/alpine-apache-php7:php-7.1

ADD [".", "/app"]
WORKDIR /app

RUN apk add --update --no-cache nodejs nodejs-npm \
 && composer update \
 && npm install \
 && ./node_modules/gulp/bin/gulp.js \
 && chown -R apache:apache /app \
 && apk del nodejs nodejs-npm
