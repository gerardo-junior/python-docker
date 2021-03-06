LABEL maintainer="Gerardo Junior <me@gerardo-junior.com>"
LABEL url="https://github.com/gerardo-junior/python-docker.git"
LABEL version="1.0"

ARG PYTHON_VERSION=3.6

FROM python:$PYTHON_VERSION-alpine

ENV USER python
ENV WORKDIR /src
ENV SHELL /bin/sh

# Creating project directory
RUN mkdir -p $WORKDIR

# Creating user and empowering sudo
RUN set -xe && \
    addgroup -g 1000 $USER && \
    adduser -u 1000 -G $USER -s $SHELL -D $USER && \
    apk --no-cache --update add --virtual .persistent-deps sudo && \
    echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/default && \
    chown -Rf $USER $WORKDIR

# Clean up
RUN set -xe && \
    apk -v cache clean && \
    rm -rf /tmp/* \
           /var/cache/apk/* \
           /usr/share/doc/* \
           /usr/share/info/* \
           /usr/share/man/* \
           /var/cache/man/*

# Copying script tools
COPY ./tools /opt/tools
RUN chmod -R +x /opt/tools/
ENV PATH $PATH:/opt/tools

# Setting project directory
VOLUME [$WORKDIR]
WORKDIR $WORKDIR
USER $USER
ENTRYPOINT [$SHELL, "/opt/tools/entrypoint.sh"]
