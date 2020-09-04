FROM 744117028012.dkr.ecr.us-west-2.amazonaws.com/csgo-base
COPY ./files/ /
RUN echo starting build \
    && trap no_ctrlc INT \
    && trap term_handler TERM \
    && ctrlc_count=0 \
    && chmod +x /*.sh \
    && . ./lib.sh --source-only \
    && update
VOLUME ["/var/csgo/cfg"]
CMD ["/supervisor.sh"]
