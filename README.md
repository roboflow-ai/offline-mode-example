# Setting Up Docker Registry - License Server

https://docs.docker.com/registry/

Then gather the Roboflow image - example here as if we are running the local registry on `localhost:5000`:

``` 
    sudo docker pull roboflow/inference-server:cpu
    sudo docker tag roboflow/inference-server:cpu localhost:5000/inference-server:cpu
    sudo docker push localhost:5000/inference-server:cpu
``` 

# Setting up Roboflow License Server - License Server

https://docs.roboflow.com/inference/enterprise#using-the-license-server

# Set up Script for Roboflow Inference Server - DMZ

`./setup_inference_server <License Server IP>  <Docker Registry IP> <Your Project> <Your Version> <Your Roboflow API Key>`

The deployment script assumes that the local license server and docker registry are up <License Server IP> <Docker Registry IP> on ports `8080` and `5000`, respectively.

The deployment script starts the inference server and tests it on an example image - replace `example.jpg` with a test image of your choosing.

If successful, you will see an example inference like the following: 

```
cpu: Pulling from inference-server
Digest: sha256:66e351ce17ed6b9875b1b401784135ee196a9a19f4c3b3adf606b1f17fd2d237
Status: Image is up to date for localhost:5000/inference-server:cpu
localhost:5000/inference-server:cpu
roboflow
d3e9defdb9416e85aa8ffdc3ea7897b67a1ffe6e2566b4e97dd195431d2c2e1a
waiting for server to start and running first inference...
{
    "predictions": [
        {
            "x": 315.1,
            "y": 312.7,
            "width": 73,
            "height": 101,
            "class": "WBC",
            "confidence": 0.887
        },
        {
            "x": 60.5,
            "y": 36.2,
            "width": 71,
            "height": 71,
            "class": "RBC",
            "confidence": 0.855
        },
        ...
```
