ARG HADOOP_VERSION=""
ARG JAVA_VERSION=""

FROM mpolatcan/hadoop:${HADOOP_VERSION}-java${JAVA_VERSION}

ARG MAHOUT_VERSION=""
ARG MAHOUT_DOWNLOAD_LINK="http://www-eu.apache.org/dist/mahout/${MAHOUT_VERSION}/apache-mahout-distribution-${MAHOUT_VERSION}.tar.gz"

ENV MAHOUT_HOME "${HDUSER_HOME}/mahout"
ENV PATH $PATH:$MAHOUT_HOME/bin

MAINTAINER Mutlu Polatcan <mutlupolatcan@gmail.com>

USER root
RUN mkdir -p ${MAHOUT_HOME} && \
    wget ${MAHOUT_DOWNLOAD_LINK} && \
    tar -xvzf apache-mahout-distribution-${MAHOUT_VERSION}.tar.gz -C ${HDUSER_HOME} && \
    mv ${HDUSER_HOME}/apache-mahout-distribution-${MAHOUT_VERSION}/* ${MAHOUT_HOME} && \
    rm -r ${HDUSER_HOME}/apache-mahout-distribution-${MAHOUT_VERSION} && \
    rm apache-mahout-distribution-${MAHOUT_VERSION}.tar.gz && \
    chown -R hduser:hadoop ${MAHOUT_HOME}

USER hduser
ENTRYPOINT ["./hadoop_entrypoint.sh", "hadoop"]