#!/bin/bash
docker run -d -P --name graphite-web --volumes-from graphite-data tobi/graphite 
