#!/bin/sh

API_URL="https://api.github.com/repos/glpi-project/glpi/releases/latest"
GLPI_VER=$(curl -s $API_URL | grep tag_name | cut -d '"' -f 4)
GLPI_PKG=$(curl -s $API_URL | grep browser_download_url | cut -d '"' -f 4)
FILENAME="glpi-$GLPI_VER.tgz"
GLPI_DIR="glpi"
CURRENT_DIR=$(pwd)

echo "Downloading latest version: $GLPI_VER"
cd $CURRENT_DIR
[[ -d $GIT_REPO_DIR ]] && rm -rf $GIT_REPO_DIR
[ -f $FILENAME ] && echo "File already exists, skipping download..."; sleep 1.2
[ ! -f $FILENAME ]  && curl -L -# -o $FILENAME $GLPI_PKG

[[ -d $GLPI_DIR ]] && echo "directory '$GLPI_DIR' already exists, deleting"; sleep 1.2; rm -rf $GLPI_DIR
tar zxvf $FILENAME

echo "Building Docker image"
docker build ./$GLPI_DIR -t $GLPI_DIR:bnphu-$GLPI_VER --file Dockerfile --no-cache

echo "Completed! 🐳"