# node-docker-volume

An example of how to run node.js code stored on external volume on node base image

## Steps

### Download the base image

```bash
docker pull node:12-alpine
```

### Build the code

```bash
docker build -t node-docker-volume:1.0.0 .
```

### Copy the code to external volume

```bash
docker volume create node-docker-volume_1.0.0
docker run --rm \
 -v node-docker-volume_1.0.0:/usr/src/app \
 --entrypoint=/bin/cp \
 node-docker-volume:1.0.0 \
 -L -r -a /usr/src/build/. /usr/src/app/
```

### Run the code on base image with the external volume

```bash
docker run --rm \
 --expose 3000 \
 -p 3000:3000 \
 -v node-docker-volume_1.0.0:/usr/src/app \
 -w /usr/src/app \
 node:12-alpine \
 index.js
```

### Cleanup
```bash
docker rmi node-docker-volume:1.0.0
```

## Remark

### Volume Content Inspection

```bash
docker run \
 --rm \
 -v node-docker-volume_1.0.0:/usr/src/app \
 --entrypoint=/bin/ls \
 node:12-alpine /usr/src/app -l -a
```

### Volume Size Inspection
```bash
docker system df -v | grep node-docker-volume_1.0.0
```