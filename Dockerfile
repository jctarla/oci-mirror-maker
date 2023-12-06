FROM ubuntu:20.04

ARG BINARY_FILE_NAME="kafka_2.12-3.6.0"
ARG BINARY_FILE="https://downloads.apache.org/kafka/3.6.0/kafka_2.12-3.6.0.tgz"

RUN apt-get update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install -qq wget -y 
RUN apt-get install -qq gpg -y 
RUN apt-get install -qq gettext -y 
RUN apt-get install -qq openjdk-8-jre -y 
RUN wget -nv $BINARY_FILE
RUN mkdir -p /opt/Kafka
RUN tar xzf $BINARY_FILE_NAME.tgz -C /opt
RUN mv /opt/$BINARY_FILE_NAME/* /opt/Kafka
RUN rm $BINARY_FILE_NAME.tgz

WORKDIR "/opt/Kafka/"
COPY --chown=600 config config
COPY --chown=755 entrypoint.sh ./
RUN chmod +x entrypoint.sh

ENTRYPOINT ./entrypoint.sh