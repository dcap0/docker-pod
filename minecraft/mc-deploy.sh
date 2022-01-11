#!/bin/bash

echo $1

echo "Starting Redeploy of Minecraft Server"
echo "Stopping Container"
docker kill mc-serv
echo "Removing Old Container"
docker rm mc-serv
echo "Removing Old Image"
docker image rm mc-serv
echo "Building New Image"
docker build -f ./Dockerfile.mc -t mc-serv --no-cache . &&
echo "Starting Container"
docker run --name mc-serv -dit -p 1025:25565 mc-serv &&

echo "Execution Complete"
