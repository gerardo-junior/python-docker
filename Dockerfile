ARG PYTHON_ENV=3.6

FROM python:$PYTHON_ENV

RUN mkdir -p /src
WORKDIR /src

# Create entrypoint
COPY ./tools /opt/tools
RUN chmod -R +x /opt/tools/
ENTRYPOINT ["/bin/sh", "/opt/tools/entrypoint.sh"]               
