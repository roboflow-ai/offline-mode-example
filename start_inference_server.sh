#bin/bash
LICENSE_SERVER_IP=$1
DOCKER_REGISTRY_IP=$2
ROBOFLOW_PROJECT=$3
ROBOFLOW_VERSION=$4
ROBOFLOW_API_KEY=$5

#pull from local registry
sudo docker pull $DOCKER_REGISTRY_IP:5000/inference-server:cpu

#make docker volume for cache
sudo docker volume create roboflow

#launch inference server with license server and cache mount
sudo docker run -d --net=host --env LICENSE_SERVER=$LICENSE_SERVER_IP --mount source=roboflow,target=/cache $DOCKER_REGISTRY_IP:5000/inference-server:cpu

#wait for server to start
echo "waiting for server to start and running first inference..."
sleep 3s

#test server deployment
base64 example.jpg | curl -d @- "localhost:9001/${ROBOFLOW_PROJECT}/${ROBOFLOW_VERSION}?api_key=${ROBOFLOW_API_KEY}"