#!/bin/bash
shopt -s extglob

CWD="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"

# zip -r "$(dirname "$CWD")/$(basename "$CWD").ftl" !(build.sh)
cd "$CWD"

modFileName="$(basename "$CWD")"
git archive -o "$modFileName.zip" main

mv "$modFileName.zip" "../$modFileName.ftl"
