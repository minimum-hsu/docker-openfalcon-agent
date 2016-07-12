FROM alpine:3.4

MAINTAINER minimum@cepave.com

ARG DOCKERDIR=docker/ubuntu
ENV WORKDIR=/home/agent PACKFILE=falcon-agent.tar.gz CONFIGDIR=/config CONFIGFILE=cfg.json

# Set timezone, bash, config dir
# Set alias in the case of user want to execute control in their terminal
RUN \
  apk add --update tzdata bash \
  && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
  && echo "Asia/Taipei" > /etc/timezone \
  && echo "alias ps='pstree'" > ~/.bashrc \
  && mkdir -p $WORKDIR $CONFIGDIR

# Install Open-Falcon Agent Component
RUN \
  apk add -Uu --no-cache git perl python python3\
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
