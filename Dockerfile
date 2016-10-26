FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y \
  build-essential \
  ruby \
  ruby-dev \
  libmariadb-client-lgpl-dev \
  zlib1g-dev \
  nginx \
  supervisor

ENV RAILS_ENV production

RUN \
  chown -R www-data:www-data /var/lib/nginx && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  rm /etc/nginx/sites-enabled/default

RUN gem install bundler
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN cd /tmp && bundle install --jobs=4

ADD nginx/enda-api.conf /etc/nginx/sites-enabled/
ADD supervisor.conf /etc/supervisor/conf.d/

RUN mkdir -p /var/www/api.endaaman.me
ADD . /var/www/api.endaaman.me
WORKDIR /var/www/api.endaaman.me

EXPOSE 80 443
CMD make db && /usr/bin/supervisord
