FROM ruby:2.6.6
RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  npm