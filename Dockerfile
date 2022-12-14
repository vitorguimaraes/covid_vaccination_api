FROM elixir:1.13-alpine

RUN apk add --no-cache openssl && \
    apk add --no-cache inotify-tools && \
    mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install hex phx_new --force

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 4000