#!/bin/bash

HADOOP_VERSIONS=(
    "3.2.1"
    "3.1.2"
    "2.9.2"
    "2.8.5"
    "2.7.7"
)

MAHOUT_VERSIONS=(
    "0.13.0"
    "0.12.2"
    "0.11.2"
)

JAVA_VERSIONS=(
    "8"
)

# $1: MAHOUT_VERSION
# $2: HADOOP_VERSION
# $3: JAVA_VERSION
function build_image() {
  sudo docker build -q -t mpolatcan/mahout:$1-hadoop-$2-java$3 --build-arg MAHOUT_VERSION=$1 --build-arg HADOOP_VERSION=$2 --build-arg JAVA_VERSION=$3 ./src/
	sudo docker push mpolatcan/mahout:$1-hadoop-$2-java$3
	sudo docker rmi mpolatcan/mahout:$1-hadoop-$2-java$3
}

for MAHOUT_VERSION in ${MAHOUT_VERSIONS[@]}; do
    for HADOOP_VERSION in ${HADOOP_VERSIONS[@]}; do
        for JAVA_VERSION in ${JAVA_VERSIONS[@]}; do
            build_image $MAHOUT_VERSION $HADOOP_VERSION $JAVA_VERSION
        done
    done
done
