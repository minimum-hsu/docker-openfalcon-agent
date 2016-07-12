FROM ubuntu:14.04.2

MAINTAINER minimum@cepave.com

ARG DOCKERDIR=docker/ubuntu
ENV WORKDIR=/home/agent PACKFILE=falcon-agent.tar.gz CONFIGDIR=/config CONFIGFILE=cfg.json

# Install Open-Falcon Agent Component
RUN \
  apt-get update \
  && apt-get install -y git \
  && mkdir -p $WORKDIR $CONFIGDIR
ADD $DOCKERDIR/$PACKFILE $WORKDIR
COPY src/$CONFIGFILE $CONFIGDIR/
RUN ln -sf $CONFIGDIR/$CONFIGFILE $WORKDIR/$CONFIGFILE

WORKDIR $WORKDIR
COPY $DOCKERDIR/run.sh $WORKDIR/

# Port
EXPOSE 1988

# Start
ENTRYPOINT ["/bin/bash"]
CMD ["run.sh"]
