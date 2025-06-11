FROM ubuntu:24.04

# Copy entire init-db directory
COPY init-db/ /init-db/
COPY scripts/ /scripts/

RUN bash /scripts/install.sh

# CMD ["/scripts/init.sh"]