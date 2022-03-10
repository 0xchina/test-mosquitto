#!/bin/sh


docker run -p 1883:1883 -v $(pwd)/mosquitto/mosquitto.conf:/mosquitto/config/mosquitto.conf -v $(pwd)/auth.json:/mosquitto/auth/dynamic-security.json eclipse-mosquitto


echo "::mosquitto ruuunnnning"