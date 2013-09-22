#!/bin/bash -ex

# Git bootstrap
if ! (which git); then
    sudo apt-get update
    sudo apt-get install -y git-core
fi

INSTALLER_URL=${INSTALLER_URL:-https://github.com/kelby/cf_nise_installer_services.git}
INSTALLER_BRANCH=${INSTALLER_BRANCH:-master}

if [ ! -d cf_nise_installer_services ]; then
    git clone ${INSTALLER_URL} cf_nise_installer_services
fi

(
    cd cf_nise_installer_services
    git checkout ${INSTALLER_BRANCH}
    git pull
    ./local/install.sh
)
