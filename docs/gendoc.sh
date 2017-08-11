#!/bin/bash

DOCS="$(dirname $(readlink -f $0))"
ROOT="$(dirname ${DOCS})"
CONFIG="${DOCS}/config.ld"

cd "${ROOT}"

# Clean old files
rm -rf "${DOCS}/api.html" "${DOCS}/scripts" "${DOCS}/modules"
# Create new files
ldoc -c "${CONFIG}" -d "${DOCS}" "${DOCS}"

# Put "prefix:name_" settings in angled brackets (<>)
sed -i -e 's|>prefix:name|>\&lt;prefix\&gt;:\&lt;name\&gt;|' "${DOCS}/api.html"
