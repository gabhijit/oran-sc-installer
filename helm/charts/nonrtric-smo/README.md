# Introduction

This directory contains charts required for installing a complete NonRTRIC SMO using the components from the ORAN SC and ONAP. The goal is to have charts at single place for SMO as well as Non RT RIC components. Also we will be documenting the process by which the charts are built.

# Architecture

For the current architecture of the NonRT RIC platform, please refer to the ![architecture diagram](images/NonRTRicArchitecture.svg "Architecthre").


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


