# Red Hat Enterprise Linux base image
FROM rhel7:latest

#Maintainer
MAINTAINER Kiran Chitturi "kiran.chitturi@lucidworks.com"

#Environment Variables and Labels
ENV FUSION_VERSION 2.2.0 
ENV FUSION fusion-$FUSION_VERSION 
ENV FUSION_USER fusion

LABEL Vendor Lucidworks
LABEL Version 2.2.0
LABEL Release Fusion
LABEL Name rhel7/fusion

#Install necessary packages - grab the software and install it
RUN yum -y install less wget vim curl lsof procps tar 
#RUN yum -y install java
RUN yum -y install jre 
RUN groupadd -r $FUSION_USER && \
  useradd -r -g $FUSION_USER $FUSION_USER && \
  mkdir -p /opt && \
  mkdir -p /opt/lucidworks && \
  wget --no-check-certificate --output-document=/opt/lucidworks/$FUSION.tar.gz https://s3.amazonaws.com/lucidworks-apollo-beta/$FUSION.tar.gz && \
  tar -C /opt/lucidworks --extract --file /opt/lucidworks/$FUSION.tar.gz && \
  rm /opt/lucidworks/$FUSION.tar.gz && \
  chown -R $FUSION_USER:$FUSION_USER /opt/lucidworks/fusion

#Clean the cache
RUN yum clean all

#Expose the necessary tcp ports
EXPOSE 8764 
#WORKDIR /opt/lucidworks/fusion $USER $FUSION_USER 

#Command to run when launching the container
CMD ["/bin/bash", "-c", "/opt/lucidworks/fusion/bin/fusion start; while true; do sleep 3600; done"]
