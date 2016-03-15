# RHEL7Fusion

The following is a RHEL7 based Dockerfile/image for Lucidworks Fusion.
It MUST be built on a RHEL7 Enterprise host with RHEL Docker and software entitlement.

To build:

1. Clone this repo on a RHEL7 host with Docker installed/running and software entitlement
2. Build contianer - docker build -t rhel7/fusion
3. Once complete, launch the container - docker run -d -P rhel7/fusion
4. Verifiy the container is running - docker ps
5. Connect to the web UI with a browser - http://ip_addr:port (you will see the tcp port mapped to the Solr port
of 8764)
6. Follow instructions in the browser
