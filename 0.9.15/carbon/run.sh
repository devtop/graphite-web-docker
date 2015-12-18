#!/bin/bash
docker run -d --name carbon --volumes-from graphite-data tobi/carbon 
