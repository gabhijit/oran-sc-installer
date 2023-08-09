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

### Install instructions
$ helm repo add strimzi https://strimzi.io/charts
$ helm install strimzi strimzi@strimzi-kafka-operator --version 0.36.0

# Components

## VES Collector

VES collector is a component to which the RAN devices will send data in the VES format. The VES collector is built using the following repository and build commands.

### Repository and Build Commands

VES Collector Repo - https://gerrit.onap.org/r/dcaegen2/collectors/ves

Currently we will be using the latest 'released' images from ONAP. Hence the build instructions described below are not useful. But they are mentioned here for completion. At some point of time when we will make changes to VES collector, it's possible that those changes will be maintained in a separate repository and we should also then follow the build process(es). To build and publish Docker Images. (TODO: Add Build instructions).

### Exposed External Services

The VES collector APIs are exposed externally by the platform and are available as publicly available end points which will be routed to by the Ingress to the VES collector services.

API End point - ves.{subdomain} - where {subdomain} will be an override value that will be used during deployment using helm charts.

### Additional Notes

1. The current VES collector builds with JDK 11 a rather old version of JDK.
