#!/bin/bash

# exit on error
set -e

cd vulcan-api/contrib/dev

./setup-dependencies.sh

./run.sh local-dev.toml &

cd -

cd vulnerability-db-api
go install ./...
cd ../vulnerability-db/db && source postgres-start.sh && cd -
cd ../vulnerability-db/db && source flyway-migrate.sh && cd -
vulnerability-db-api -c ../conf/vulnerablity-db-api/local.toml &

cd ..

pwd
cp conf/vulcan-ui/config.json vulcan-ui/src/config.json 

cd vulcan-ui

npm install

npm run-script serve &

cd -

docker build -t vulcan-nginx .

docker run -d --add-host=host.docker.internal:172.17.0.1 -p 8081:8081 --rm --name vulcan-nginx vulcan-nginx 

echo "

#########################################################################
#
#--> Initialization complete. Now access http://localhost:1234/index.html
#
#########################################################################

"
