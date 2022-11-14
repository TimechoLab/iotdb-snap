#!/usr/bin/env bash
sudo snap install snapcraft --classic

sudo apt-get install jq -y

rm env-amd.tar.gz
rm env-arm.tar.gz

LATEST=$(curl -s https://api.github.com/repos/TimechoLab/iotdb-snap/releases/latest)

for i in {0..1}
do
	FILTER=.assets[$i].browser_download_url
	DOWNLOAD_URL=$(echo $LATEST | jq -r $FILTER)
	wget $DOWNLOAD_URL
done
