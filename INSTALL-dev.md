# Overview

The instructions in this document are geared towards installing the ORAN SC Non Real Time RIC and Near Real Time RIC on the developers desktop. Currently the installation focuses on the publicly released versions of the ORAN SC and ONAP components that are part of the respective platforms.


# High Level Overview

The platform(s) are installed as [Helm Charts](https://helm.sh) using Helm Version 3. The installation process roughly follows the following main steps -

1. Download and setup required helm components
   - Helm  Binary for building the installation charts.
   - Chart Museum : Serving as a local repository
   - Helm Chart Museum Push Plugin : (`helm cm-push`) For pushing the built and generated charts to chart museum from which they are downloaded.

```bash
# Following commands are run as non root user. The idea is to keep the privileges to minimum.

# Create a `temp/` directory in the home folder that will be used to download all the artifacts required during the bring up.
$ mkdir temp
$ cd temp
$ wget https://get.helm.sh/helm-v3.11.2-linux-amd64.tar.gz
$ wget https://get.helm.sh/chartmuseum-v0.13.1-linux-amd64.tar.gz
$ tar xvzpf helm-v3.11.2-linux-amd64.tar.gz
$ tar xvzpf chartmuseum-v0.13.1-linux-amd64.tar.gz

# It is assumed that ~/bin/ is in your $PATH
$ cp linux-amd64/chartmuseum linux-amd64/helm ~/bin
$ helm version
$ chartmuseum -version

# To Push to chart museum, we will need to install a Chart Museum push plugin.
$ wget https://github.com/chartmuseum/helm-push/releases/download/v0.10.3/helm-push_0.10.3_linux_amd64.tar.gz

# Following lines to export current (default) $HELM_* variables
$ set -a
$ eval (helm env)
$ set +a
$ tar -C $HELM_PLUGINS -xvzpf helm-push_0.10.3_linux_amd64.tar.gz

# This should have the `cm-push` command available.
$ helm plugin list
NAME   	VERSION	DESCRIPTION
cm-push	0.10.3 	Push chart package to ChartMuseum
```

2. Setup Local Helm repository using Chart Museum.
```sh
# This step is fairly simple, simply run the chartmusem command with appropriate options
# We are using local storage backend and port 6873 (MUSE) and a directory called `helm/chartmuseum/`
# The setup is kept simple.
$ chartmuseum --debug --port 6873 --storage local --storage-local-rootdir $HOME/helm/chartsmuseum/
```
3. Build individual Charts. For this we are using the definitions from the `dep/` repository of ORAN-SC.
  - ORAN-SC Charts are inside the directory `helm/charts/oran-sc` (Currently Non RT RIC only)
  - Required ONAP Charts are inside the directory `helm/charts/onap` (Only those required for our deployment).

4. Deploy a single node `k8s` cluster. Deploy the charts to this cluster.
