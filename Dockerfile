FROM eclipse-mosquitto
COPY entrypoint.sh /entrypoint.sh
EXPOSE 1883 9001 8883 9883
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]