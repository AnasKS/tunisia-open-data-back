#!/bin/sh

if [ $1 ]
  then
    echo 'Setting RAILS_ENV to $1'
    export RAILS_ENV=$1
else
  echo 'using default RAILS_ENV'
fi

# Remove previous server pid if it exits.
rm -f tmp/pids/server.pid
# Migrate database
bundle exec rails db:migrate
# Launch server
bundle exec rails server -b 0.0.0.0 -p $RAILS_PORT
