#!/bin/bash

HADOOP_VERSIONS=(
    "3.2.1"
    "3.1.2"
    "2.9.2"
    "2.8.5"
    "2.7.7"
)

MAHOUT_VERSIONS=(
    "0.14.0"
    "0.13.0"
    "0.12.2"
    "0.11.2"
)

DISTS=(
    "alpine"
    "ubuntu"
)

# $1: DIST
# $2: MAHOUT_VERSION
# $3: HADOOP_VERSION
function build_image() {
    sudo docker build -q -t mpolatcan/mahout:$1-$2-hadoop-$3 --build-arg MAHOUT_VERSION=$2 --build-arg HADOOP_VERSION=$3 ./$1/
	sudo docker push mpolatcan/mahout:$1-$2-hadoop-$3
	sudo docker rmi mpolatcan/mahout:$1-$2-hadoop-$3
}

for MAHOUT_VERSION in ${MAHOUT_VERSIONS[@]}; do
    for HADOOP_VERSION in ${HADOOP_VERSIONS[@]}; do
        for DIST in ${DISTS[@]}; do
            build_image $DIST $MAHOUT_VERSION $HADOOP_VERSION
        done
    done
done