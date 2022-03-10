#!/bin/sh


docker run -p 1883:1883 -v /mosquitto.conf:/mosquitto/config/mosquitto.conf -v /auth.json:/mosquitto/auth/dynamic-security.json eclipse-mosquitto


echo "::mosquitto ruuunnnning"