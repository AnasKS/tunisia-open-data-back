#!/bin/sh

# Remove previous server pid if it exits.
rm -f tmp/pids/server.pid
# Migrate database
bundle exec rails db:migrate
# Launch server
bundle exec rails server -b 0.0.0.0 -p 3000
