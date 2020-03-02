ARG PYTHON_ENV=3.6

FROM python:$PYTHON_ENV-alpine

ENV USER "python"
ENV WORKDIR "/src"

# Creating project directory
RUN mkdir -p $WORKDIR

# Creating user and empowering sudo
RUN set -xe && \
    addgroup -g 1000 $USER && \
    adduser -u 1000 -G $USER -s /bin/sh -D $USER && \
    apk --update add --virtual .persistent-deps sudo && \
    echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/default && \
    chown -Rf $USER $WORKDIR

COPY ./tools /opt/tools
RUN chmod -R +x /opt/tools/

# Setting project directory
VOLUME [$WORKDIR]
WORKDIR $WORKDIR
USER $USER
ENTRYPOINT ["/bin/sh", "/opt/tools/entrypoint.sh"]
