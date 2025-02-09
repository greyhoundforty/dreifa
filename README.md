# Dreifa
---

## Overview

My personal swiss-army knife container for IBM Cloud related projects. The container includes various tools and utilities to facilitate working with IBM Cloud, Kubernetes, and OpenShift.

## Included Tools

The container includes the following tools:

- **IBM Cloud CLI**: Command-line interface for managing IBM Cloud resources.
- **IBM Cloud CLI Plugins**: Various plugins for IBM Cloud CLI, including:
  - Code Engine
  - Cloud Databases
  - DNS Services
  - Cloud Internet Services
  - Cloud Object Storage
  - Container Registry
  - Container Service
  - VPC Infrastructure
  - Schematics
  - SoftLayer (Classic IaaS)
  - Transit Gateway
- **OpenShift CLI**: Command-line tools for managing OpenShift clusters.
- **Kubernetes CLI**: Command-line tool for interacting with Kubernetes clusters.
- **Kubetail**: Utility to tail logs from multiple pods in a Kubernetes cluster.
- **Starship**: Cross-shell prompt for customizing the terminal prompt.
- **Mise**: Tool for managing shell environments.

## Installation

The container is built using a `Dockerfile` that installs the necessary tools and utilities. The installation script (`install.sh`) is used to install and configure the tools.

### Dockerfile

The `Dockerfile` is based on the `debian:12-slim` image and includes the following steps:

1. Update and install necessary packages.
2. Copy and execute the `install.sh` script to install the tools.
3. Copy the `bashrc` file to configure the shell environment.

### Install Script

The `install.sh` script performs the following actions:

1. Installs the IBM Cloud CLI and its plugins.
2. Installs the OpenShift CLI.
3. Installs the Kubernetes CLI (`kubectl`).
4. Installs Kubetail.
5. Installs Starship and configures it.
6. Installs Mise.

## Usage

To use the container, build it using Docker and run it:

```sh
docker buildx build --platform YOUR_PLATFORM -t dreifa .
docker run -it dreifa 
```
