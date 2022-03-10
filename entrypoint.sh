#!/bin/sh
CONFIG=$1
docker_run="docker run"
docker_run="$docker_run -p 1883:1883
# docker_run="$docker_run -p 1883:1883 -v /mosquitto.conf:/mosquitto/config/mosquitto.conf -v /auth.json:/mosquitto/auth/dynamic-security.json eclipse-mosquitto"
# echo $docker_run
# sleep 10000
sh -c "$docker_run"
# echo "::mosquitto ruuunnnning"