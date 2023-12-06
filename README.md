# Setup Apache Kafka Mirror Maker 2.0 in Oracle OCI Streaming ACTIVE/ACTIVE

## Pre-requisites

- Two available OCI Regions, like GRU/VCP
- Make sure you have all needed policy in place for working with Streams (Producer/Consumer)
- An OCI Streaming topic called **TOPICO_COM_DR** in GRU
- An OCI Streaming topic called **TOPICO_COM_DR** in VCP
- In GRU region, Create a Kafka Connect Configurations and take note of the OCID, this is the **harness ocid**
- In VCP region, Create a Kafka Connect Configurations and take note of the OCID, this is the **harness ocid** 


## Environment variables for your container  

  | Variable | Content |
  |-----------------|------|
  |SOURCE_REGION | sa-saopaulo-1 |
  |TARGET_REGION | sa-vinhedo-1 | 
  |CONNECT_HARNESS_OCID_GRU | ocid1.connectharness.oc1.sa-saopaulo-1.XXX_GET_YOURS_XXX | 
  |CONNECT_HARNESS_OCID_VCP | ocid1.connectharness.oc1.sa-vinhedo-1.XXX_GET_YOURS_XXX | 
  |TENANCY_NAME | YOUR_TENANCY_NAME |
  |USER_NAME | USERNAME_STREAM_POOL_KAFKA_CONNECTION_SETTINGS | 
  |AUTH_CODE | YOUR_AUTH_TOKEN_FOR_THE_USER |
  |SOURCE_STREAM_POOL | STREAM_POOL_OCID_FROM_GRU | 
  |TARGET_STREAM_POOL| STREAM_POOL_OCID_FROM_VCP |
  |LOG_LEVEL | WARN | 

## Build your image
```
  # On the root of this repository directory
  docker build . -t yourlocation/oci-mirror-maker:latest 
```

## Run your container
```
docker run -e SOURCE_REGION="sa-saopaulo-1" \
 -e TARGET_REGION="sa-vinhedo-1" \
 -e CONNECT_HARNESS_OCID_GRU="ocid1.connectharness.oc1.sa-saopaulo-1.xxxx" \
 -e CONNECT_HARNESS_OCID_VCP="ocid1.connectharness.oc1.sa-vinhedo-1.xxxxx" \
 -e TENANCY_NAME="my_tenancy_name" \
 -e USER_NAME="myuser-xxx" \
 -e AUTH_CODE="xxxxxxxx" \
 -e SOURCE_STREAM_POOL="ocid1.streampool.oc1.sa-saopaulo-1.xxx" \
 -e TARGET_STREAM_POOL="ocid1.streampool.oc1.sa-vinhedo-1.xxx" \
 -e LOG_LEVEL=WARN yourlocation/oci-mirror-maker:latest 
```



## References
 https://github.com/oracle-quickstart/oci-oss-mirror-maker  
 https://blogs.oracle.com/cloud-infrastructure/post/mirror-maker2-mm2-and-oracle-streaming-service-oss
