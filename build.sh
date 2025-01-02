#!/bin/bash
shopt -s extglob

CWD="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"
cd "$CWD"

modFileName="$(basename "$CWD")"
modsDir="$(realpath -s "$1")"

if [ -d "$modsDir" ]; then
    echo Saving as \`"$modsDir/$modFileName.ftl"\`
    zip -r "$modsDir/$modFileName.ftl" !(.git)
else
    echo "Path to slipstream's mods/ directory is required!"
    exit 1
fi
