FROM ruby:3.1-slim

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

WORKDIR /usr/src/app

COPY Gemfile just-the-docs.gemspec ./
RUN gem install bundler:2.1.4 && bundle _2.1.4_ install
RUN bundle update --bundler  

EXPOSE 4000

