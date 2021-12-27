@ECHO OFF
ECHO Starting Redeploy of Minecraft Server
ECHO Stopping Container
docker kill mc-serv
ECHO Removing Old Container
docker rm mc-serv
ECHO Removing Old Image
docker image rm mc-serv
ECHO Building New Image
@REM docker build -f .\Dockerfile.mc -t mc-serv --no-cache .
docker build -f .\Dockerfile.mc -t mc-serv .
ECHO Starting Container
docker run --name mc-serv -dit -p 1025:25565 mc-serv
ECHO Execution Complete