#!/bin/bash
HOST_UID=$(id -u)
HOST_GID=$(id -g)
docker build -t c7-nifi:1.2 --build-arg HOST_UID=${HOST_UID} --build-arg HOST_GID=${HOST_GID} ./

