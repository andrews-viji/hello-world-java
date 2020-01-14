#! /bin/bash
# run container
run () {
    docker run --name python -d -p 80:80 python_test
}
# stop and remove container
stop_rm () {
    docker stop python
    docker rm python
}
# build new image for the latest build
docker build -t python_test .
# check if the production contaier is not running
if [ ! "$(docker ps -q -f name=python)" ];then
    # cehck if the container is in docker ps -a
    if [ "$(docker ps -aq -f status=exited -f name=python)" ];then
        docker rm python
    fi
    run
else
    stop_rm
    run
fi

