

FROM ruby:2.2.6

RUN mkdir /ms-users
WORKDIR /ms-users

ADD Gemfile /ms-users/Gemfile
ADD Gemfile.lock /ms-users/Gemfile.lock

RUN bundle install
ADD . /ms-users
