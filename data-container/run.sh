#!/bin/bash
docker run --name graphite-data -v /opt/graphite/storage tobi/graphite echo "data-container. Do not remove!"
