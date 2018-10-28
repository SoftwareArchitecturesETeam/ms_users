FROM ruby:2.4.2
RUN mkdir /ms-users
WORKDIR /ms-users
ADD Gemfile /ms-users/Gemfile
ADD Gemfile.lock /ms-users/Gemfile.lock
RUN bundle install
ADD . /ms-users
