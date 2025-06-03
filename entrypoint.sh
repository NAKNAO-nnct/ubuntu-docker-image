#!/bin/bash

set -e

# 127.0.0.1:2375 が起動しているか確認
until nc -z -v -w30 127.0.0.1 2375
do
    echo "waiting for docker host to start on"
    sleep 5
done

/usr/bin/dockerd --host=unix:///var/run/docker.sock --host=tcp://127.0.0.1:2375 --storage-driver=fuse-overlayfs &

# docker info が表示されるまで待つ
while ! docker info > /dev/null 2>&1; do
    echo "Waiting for Docker to start..."
    sleep 1
done
echo "Docker is running."
