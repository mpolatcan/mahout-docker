ARG HADOOP_VERSION=2.9.0

FROM mpolatcan/hadoop:alpine-${HADOOP_VERSION}

# TODO Configurations will be added

ARG MAHOUT_VERSION=0.13.0
ARG MAHOUT_DOWNLOAD_LINK="http://www-eu.apache.org/dist/mahout/${MAHOUT_VERSION}/apache-mahout-distribution-${MAHOUT_VERSION}.tar.gz"

ENV MAHOUT_HOME "/usr/local/mahout"
ENV PATH $PATH:$MAHOUT_HOME/bin

MAINTAINER Mutlu Polatcan <mutlupolatcan@gmail.com>

RUN apk --update add --no-cache curl net-tools && \
    wget ${MAHOUT_DOWNLOAD_LINK} && \
    mkdir -p ${MAHOUT_HOME} && \
    tar -xvzf apache-mahout-distribution-${MAHOUT_VERSION}.tar.gz -C /usr/local && \
    mv /usr/local/apache-mahout-distribution-${MAHOUT_VERSION}/* ${MAHOUT_HOME} && \
    rm -r /usr/local/apache-mahout-distribution-${MAHOUT_VERSION} && \
    rm apache-mahout-distribution-${MAHOUT_VERSION}.tar.gz && \
    chown -R hduser:hadoop ${MAHOUT_HOME} && \
    chmod -R 777 ${MAHOUT_HOME}

ENTRYPOINT ["./entrypoint.sh"]