#!/bin/sh

echo $1

echo "Starting Redeploy of PLEX Server"
echo "Stopping Container"
docker kill plex
echo "Removing Old Container"
docker rm plex
echo "Removing Old Image"
docker image rm plex
echo "Building New Image"
docker build -f .\Dockerfile.plex -t plx --no-cache . &&
echo "Starting Container"
if [[ $1 == "" ]]; 
then
    docker run --name plex -d -p 1024:32400 plex &&
else
    docker run --device=$1 --name plex -d -p 1024:32400 plex 

echo "Execution Complete"