#!/bin/bash
set -e
export SHELLOPTS


# IBM Cloud CLI
echo ">> ibmcloud cli"
curl -fsSL https://clis.cloud.ibm.com/install/linux > /tmp/ic-install.sh
sh /tmp/ic-install.sh
rm /tmp/ic-install.sh

# IBM Cloud CLI plugins
echo ">> ibmcloud cli plugins"
ibmcloud_plugins=( \
  code-engine \
  cloud-databases \
  cloud-dns-services \
  cloud-internet-services \
  cloud-object-storage \
  container-registry \
  container-service \
  vpc-infrastructure \
  schematics \
  sl \
  tg \
)
for plugin in "${ibmcloud_plugins[@]}"
do
  ibmcloud plugin install $plugin -f -r "IBM Cloud"
done

# OpenShift CLI
echo ">> openshift 4.x client tools"
curl -LO https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-client-linux.tar.gz
tar zxvf openshift-client-linux.tar.gz
mv oc /usr/local/bin/oc
rm -rf README.md kubectl openshift-client-linux.tar.gz

# Kubernetes
echo ">> kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl --retry 10 --retry-delay 5 -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
mv kubectl /usr/local/bin/kubectl
chmod +x /usr/local/bin/kubectl

# Kubetail
echo ">> kubetail"
curl -LO https://raw.githubusercontent.com/johanhaleby/kubetail/master/kubetail
mv kubetail /usr/local/bin/kubetail
chmod +x /usr/local/bin/kubetail

# Starship
echo ">> startship"
curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir /usr/local/bin -y
mkdir -p /root/.config && touch /root/.config/starship.toml
starship preset jetpack -o /root/.config/starship.toml

# Mise
echo ">> mise"
curl https://mise.run | sh


