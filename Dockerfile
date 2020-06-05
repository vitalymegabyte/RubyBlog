FROM ruby:2.5
RUN useradd app
RUN apt-get update -qq && apt-get install -y nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
RUN bundle update bootsnap
COPY . /myapp
#RUN chmod -R 777 .
#RUN chmod +x init.sql
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
RUN chown -R app:app  /myapp
EXPOSE 3000
USER app
# Start the main process.
#RUN setuser app rails server
CMD ["rails", "server", "-b", "0.0.0.0"]

