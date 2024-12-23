#!/bin/bash

sudo groupadd uinput

sudo usermod -aG input,uinput "${USER}"

sudo tee /etc/udev/rules.d/99-input.rules <<EOF
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
EOF

sudo udevadm control --reload-rules && sudo udevadm trigger

sudo modprobe uinput

systemctl --user enable --now kanata
