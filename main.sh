#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
git clone https://github.com/an-anime-team/an-anime-game-launcher
cp -rvf ./debian ./an-anime-game-launcher/
cp -rvf ./Makefile ./an-anime-game-launcher/
cp -rvf ./an-anime-game-launcher.desktop ./an-anime-game-launcher/
cd ./an-anime-game-launcher/

# Get build deps
apt-get build-dep ./ -y
apt-get install curl -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | CARGO_HOME=/root/.cargo sh -s -- -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
