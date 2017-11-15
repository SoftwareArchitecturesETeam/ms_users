

FROM ruby:2.2.6

RUN mkdir /ms_users
WORKDIR /ms_users

ADD Gemfile /ms_users/Gemfile
ADD Gemfile.lock /ms_users/Gemfile.lock

RUN bundle install
ADD . /ms_users
