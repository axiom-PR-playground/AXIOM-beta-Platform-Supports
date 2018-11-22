#!/bin/bash

SCRIPT_DIR=$(realpath $(dirname ${BASH_SOURCE[0]}))

DR="docker run --rm -it \
    -v $SCRIPT_DIR:/workdir \
    -w /workdir \
    -v /etc/group:/etc/group:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -u=$UID:$(id -g $USER) \
    -e USER="$USER" \
    medicineyeh/axiom-pkgbuild"

$DR make
