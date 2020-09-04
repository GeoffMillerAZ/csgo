FROM ubuntu:latest
COPY ./files/ /
RUN echo starting build \
    && trap no_ctrlc SIGINT \
    && trap term_handler SIGTERM \
    && ctrlc_count=0 \
    && . ./lib.sh --source-only \
    && [ ! -d "/opt/steam/counterstrike" ] && install || update
VOLUME ["/var/csgo/cfg"]
CMD ["/supervisor.sh"]
