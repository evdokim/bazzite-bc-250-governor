#!/bin/bash
set -euo pipefail

rm -rf oberon-governor/
git clone https://gitlab.com/mothenjoyer69/oberon-governor.git

cd oberon-governor/
sed -i 's:/etc/oberon-config.yaml:oberon-config.yaml:g' src/oberon.cpp

distrobox create --name fedora --image fedora --yes
distrobox enter fedora -- sudo dnf install libdrm-devel cmake make git g++ -y
distrobox enter fedora -- cmake .
distrobox enter fedora -- make
distrobox stop fedora --yes

mkdir -p $HOME/.local/bin
cp oberon-governor $HOME/.local/bin/
cp oberon-config.yaml $HOME/.local/bin/

mkdir -p $HOME/.config/systemd/user
cp ../oberon-governor.service $HOME/.config/systemd/user/

systemctl --user enable oberon-governor.service

cd ..
rm -rf oberon-governor/

echo "Installation is complete ✅, please reboot"

