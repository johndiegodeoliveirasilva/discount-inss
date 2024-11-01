FROM ruby:2.6.6

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql nodejs

WORKDIR /var/www/app

COPY Gemfile /var/www/app/Gemfile
COPY Gemfile.lock /var/www/app/Gemfile.lock

RUN gem install bundler -v 2.3.22
RUN bundle install
ADD . /var/www/app/
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]