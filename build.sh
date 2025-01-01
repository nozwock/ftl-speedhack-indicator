#!/bin/bash
shopt -s extglob

CWD="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"

modFileName="$(basename "$CWD")"
zip -r "$(dirname "$CWD")/$modFileName.ftl" !(.git)
