#!/bin/bash

# exit on error
set -e

cp -p conf/vulcan-persistence/docker-compose.yml vulcan-persistence/.
cp -p conf/vulcan-persistence/.env.development vulcan-persistence/.

cd vulcan-persistence

docker-compose up -d

source ~/.rvm/scripts/rvm

rvm gemset create vulcan-persistence

rvm gemset use vulcan-persistence

RAILS_ENV=development bundle exec rake db:migrate

RAILS_ENV=development bundle exec puma -C config/puma.rb &