# Introduction

This directory contains charts required for installing a complete NonRTRIC SMO using the components from the ORAN SC and ONAP. The goal is to have charts at single place for SMO as well as Non RT RIC components. Also we will be documenting the process by which the charts are built.

# Architecture

Following diagram depicts the current architecture of the NonRT RIC platform. ![architecture diagram](images/NonRTRicArchitecture.svg "Architecthre").

# Platform Components (Thirdparty)

These are the components that are to be installed before the `nonrtric-platform` chart can be installed. These are typically thirdparty platform services that are used by different components. The components mentioned as prerequisites are to be installed first before actual platform deployment.


## Strimzi Kafka Operator (Prerequisite)

For example, the nonrtric-platform uses it's own kafka service. This service has a chart of it's own, but for the chart to work a custom resource needs to be created first. These resources are made available by the `strimzi-kafka-operator` chart.

### Current Version

The current version of `strimzi-kafka-operator` is `0.36.0`.

## Kong Ingress Controller (Prerequisite)

To be able to expose services to the consumer, we will need to use some kind of Ingress controller. Currently for deployment with `minikube`, we are using the Kong ingress controller.

### Current Version

The current version of `kong` is `2.26.0`.



### Install instructions
$ helm repo add strimzi https://strimzi.io/charts
$ helm install strimzi strimzi@strimzi-kafka-operator --version 0.36.0

# Components

This section discusses the main components of the NonRTRIC platform. As far as possible we are trying to use the latest release from this components. The releases for individual components are updated after the respective releases. For example for ONAP After ONAP releases and for ORAN-SC ORAN SC Releases. This will ensure that the components are reasonably latest. Also, please refer to the exact image versions in the charts for the current version of the image(s) being deployed.

## VES Collector

VES collector is a component to which the RAN devices will send data in the VES format. The VES collector is built using the following repository and build commands.

### Repository and Build Commands

* [VES Collector Repo for cloning](https://gerrit.onap.org/r/dcaegen2/collectors/ves)
* [VES Collector Repo URL](https://gerrit.onap.org/r/admin/repos/dcaegen2/collectors/ves,general)

Currently we will be using the latest 'released' images from ONAP. Hence the build instructions described below are not useful. But they are mentioned here for completion. At some point of time when we will make changes to VES collector, it's possible that those changes will be maintained in a separate repository and we should also then follow the build process(es). To build and publish Docker Images. (TODO: Add Build instructions).

### Exposed External Services

The VES collector APIs are exposed externally by the platform and are available as publicly available end points which will be routed to by the Ingress to the VES collector services.

API End point - ves.{subdomain} - where {subdomain} will be an override value that will be used during deployment using helm charts.

### Additional Notes

1. The current VES collector builds with JDK 11 a rather old version of JDK.

## DMaaP Message Router

This component is provided by ONAP. DMaaP Message Router provides REST APIs for publishing the data to Kafka Queue.

### Repository and build commands

* [DMaaP Message Router Repo for cloning](https://gerrit.onap.org/r/dmaap/messagerouter/messageservice)
* [DMaaP Message Router Repo URL](https://gerrit.onap.org/r/admin/repos/dmaap/messagerouter/messageservice,general)

### Exposed External Services

N/A

### Additional Notes

1. This component is being deprecated by ONAP so a future version of the platform may deprecate this component as well.
