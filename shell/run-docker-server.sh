#!/usr/bin/env bash
#
# Instantiates a PlantUML server using Docker
# Takes an optional argument PORT:
#    ./run-docker-server.sh 8080
#
PORT="${1:-8080}"
docker run -d -p $PORT:8080 plantuml/plantuml-server:jetty