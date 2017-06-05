#!/bin/sh

for docker_container in $(docker ps -a -f "status=exited" -q); do
    docker rm -v $docker_container;
done

for docker_image in $(docker images -f "dangling=true" -q); do
    docker rmi $docker_image;
done

for docker_volume in $(docker volume ls -f "dangling=true" -q); do
    docker volume rm $docker_volume;
done
