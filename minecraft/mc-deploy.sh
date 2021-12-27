echo $1

echo "Starting Redeploy of Minecraft Server"
echo "Stopping Container"
docker kill mc-serv
echo "Removing Old Container"
docker rm mc-serv
echo "Removing Old Image"
docker image rm mc-serv
echo "Building New Image"
docker build -f .\Dockerfile.mc-serv -t plx --no-cache . &&
echo "Starting Container"
if [[ $1 == "" ]]; 
then
    docker run --name mc-serv -d -p 1024:32400 mc-serv &&
else
    docker run --device=$1 --name mc-serv -d -p 1024:32400 mc-serv 

echo "Execution Complete"