#!/bin/bash
HOST_UID=$(id -u)
HOST_GID=$(id -g)
docker build -t c7-nifi:latest --build-arg HOST_UID=${HOST_UID} --build-arg HOST_GID=${HOST_GID} ./

