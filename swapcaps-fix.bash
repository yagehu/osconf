#!/usr/bin/env bash

set -euxo pipefail

gsettings reset org.gnome.desktop.input-sources xkb-options
gsettings reset org.gnome.desktop.input-sources sources
