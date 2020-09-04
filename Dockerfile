# https://hub.docker.com/r/cm2network/csgo/
FROM cm2network/csgo
WORKDIR /root
# COPY ./scripts/ /
RUN echo starting build \
  && bash "${STEAMCMDDIR}/steamcmd.sh" +login anonymous \
    +force_install_dir "${STEAMAPPDIR}" \
    +app_update "${STEAMAPPID}" \
    +quit

USER ${USER}

VOLUME ${STEAMAPPDIR}

WORKDIR ${HOMEDIR}

CMD ["bash", "entry.sh"]

# Expose ports
EXPOSE 27015/tcp \
	27015/udp \
	27020/udp
