FROM docker:stable
COPY mosquitto.conf /mosquitto.conf
COPY auth.json /auth.json
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]