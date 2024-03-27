#!/usr/bin/env bash
DEFAULT_KUBECONFIG_FILE="${HOME}/.kube/config"
[[ -f "${DEFAULT_KUBECONFIG_FILE}" ]] && export KUBECONFIG="$DEFAULT_KUBECONFIG_FILE"

ADD_KUBECONFIG_FILES="${HOME}/.kube/config-files"
mkdir -p "${ADD_KUBECONFIG_FILES}"

OIFS="$IFS"
IFS=$'\n'
for f in $(find "${ADD_KUBECONFIG_FILES}" -type f); do
    export KUBECONFIG="${f}:${KUBECONFIG}"
done
IFS="$OIFS"
