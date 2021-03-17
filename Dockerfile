FROM ruby:2.7.2

ARG RAILS_ENV
ARG RAILS_PORT
ARG POSTGRES_HOST
ENV RAILS_ENV $RAILS_ENV
ENV RAILS_PORT $RAILS_PORT
ENV POSTGRES_HOST $POSTGRES_HOST

RUN apt-get update -y
RUN apt-get install postgresql-client -y

ARG IMG_NAME='api'
ARG CONFIG_PATH=/etc/$IMG_NAME
ENV INSTALL_PATH /home/$IMG_NAME

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile $INSTALL_PATH
COPY Gemfile.lock $INSTALL_PATH
RUN gem install bundler:2.2.14
RUN bundle config set without 'development test'
RUN bundle install

COPY db $INSTALL_PATH/db
COPY config $INSTALL_PATH/config
COPY bin $INSTALL_PATH/bin
COPY Rakefile $INSTALL_PATH
COPY config.ru $INSTALL_PATH
COPY entrypoint.sh $INSTALL_PATH
COPY app $INSTALL_PATH/app
COPY public $INSTALL_PATH/public
COPY lib $INSTALL_PATH/lib

RUN chown -R 10000 $INSTALL_PATH
USER 10000

EXPOSE $RAILS_PORT

CMD ["./entrypoint.sh"]
