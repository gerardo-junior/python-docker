#!/bin/sh
sudo chgrp -Rf ${USER} ${WORKDIR}

if [ -e "$(pwd)/requirements.txt" ]; then
    /usr/local/bin/python -m pip install --no-cache-dir -r requirements.txt
fi

if [ ! -z "$(which -- $1)" ]; then
    exec "$@"
else
    /usr/local/bin/python "$@"
fi
