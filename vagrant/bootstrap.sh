#!/bin/bash -ex

INSTALLER_URL=${INSTALLER_URL:-https://github.com/yudai/cf_nise_installer.git}
INSTALLER_BRANCH=${INSTALLER_BRANCH:-master}

if [ ! -d cf_nise_installer ]; then
    git clone ${INSTALLER_URL} cf_nise_installer
fi

(
    cd cf_nise_installer
    git checkout ${INSTALLER_BRANCH}
    git pull
    ./vagrant/install.sh
)
