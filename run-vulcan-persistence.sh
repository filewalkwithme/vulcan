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

cd ..

until $(curl --output /dev/null --silent --head --fail http://localhost:3000); do
    sleep 1 && echo "Waiting for vulcan-persistence";
done

for check in $(ls conf/vulcan-persistence/checks); do
    curl -s -H "Content-type: application/json" "http://localhost:3000/v1/checktypes" -d@conf/vulcan-persistence/checks/${check} | jq
done