#!/usr/bin/env bash

set -e

[ "$(which stow >/dev/null; echo $?)" -ne "0" ] && eval "echo "ERROR: install GNU stow first"; exit 1"

PWD=$(cd "$(dirname "$0")"; pwd)

cd "${PWD}" && \
find "${PWD}" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | grep -vw .git | xargs -n 1 stow --target "${HOME}" && \
cd - >/dev/null
