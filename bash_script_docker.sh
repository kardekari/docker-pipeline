#!/bin/bash

docker run -p 8888:5000 -d abdullahcodes/docker-test

echo "docker container started in detach mode(in backgroud) on host port 8888"

ls -l

echo "from ec2"
