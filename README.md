# Introduction

One of the challenges working with ORAN-SC software components is bringing up the NearRT RIC and Non RT RIC platforms up and running on a developer machine. The goal of this project is to bridge that gap. This pshould help the developers of XApps and RApps. The eventual goal of this project is to make a fully functional platform that can be deployed by the service providers.

Also, For Non RT RIC, the goal is to minimize dependencies on the ONAP and bring up those components individually. Bringing up whole of ONAP as SMO for the NonRT RIC is a bit of an overkill and we are trying to mitigate that platform.

This project will leverage the ORAN-SC software components for the platform.

# Status

Currently a single helm chart to install Near RT RIC platform is available. This project is a WIP and a substantial portion of it will be upstreamed to ORAN-SC.
