#!/bin/bash

cd /opt/Kafka/config

# set mm2 properties
envsubst < "mm2.properties" > "temp"
cat temp > mm2.properties

# configure logging properties
envsubst < "tools-log4j.properties" > "temp"
cat temp > tools-log4j.properties

rm temp
cd ../

bin/connect-mirror-maker.sh config/mm2.properties
