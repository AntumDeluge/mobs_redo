#!/bin/bash

DOCS="$(dirname $(readlink -f $0))"
ROOT="$(dirname ${DOCS})"

CONFIG="${DOCS}/config.ld"
OUT="${DOCS}"

cd "${ROOT}"
ldoc -c "${CONFIG}" -d "${OUT}" "${ROOT}/api.ld"
