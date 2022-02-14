#!/usr/bin/env bash

set -euxo pipefail

home-manager switch --flake .#huyage
sudo nixos-rebuild switch --flake .#
