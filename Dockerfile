FROM ruby:3.1.0-slim

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

WORKDIR /usr/src/app

COPY Gemfile just-the-docs.gemspec ./
RUN gem install bundler && bundle install

EXPOSE 4000

