@ECHO OFF
ECHO Starting Redeploy of PLEX Server
ECHO Stopping Container
docker kill plex
ECHO Removing Old Container
docker rm plex
ECHO Removing Old Image
docker image rm plex
ECHO Building New Image
docker build -f .\Dockerfile.plex -t plex --no-cache .
@REM docker build -f .\Dockerfile.plex -t plex .
ECHO Starting Container
docker run --name plex -d -p 1024:32400 plex
ECHO Execution Complete