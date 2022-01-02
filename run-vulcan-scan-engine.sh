#!/bin/bash

# exit on error
set -e

docker run -d --rm -v $(pwd)/conf/vulcan-scan-engine/goaws.yaml:/tmp/goaws.yaml --name goaws -p 4100:4100 pafortin/goaws -config /tmp/goaws.yaml

cd vulcan-scan-engine

go install ./...

./db/postgres-start.sh

vulcan-scan-engine -c ../conf/vulcan-scan-engine/local.toml &