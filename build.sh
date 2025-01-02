#!/bin/bash
shopt -s extglob

CWD="$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")"
cd "$CWD"

modFileName="$(basename "$CWD")" # i.e. same as the mod folder name
outputDir="$(realpath -s "$1")"
modFilePath="$outputDir/$modFileName.ftl"

if [ -d "$outputDir" ]; then
    if [ -f "$modFilePath" ]; then
        command rm -f "$modFilePath"
    fi
    echo Saving as \`"$modFilePath"\`
    zip -r "$modFilePath" $(command ls -I build.sh -I README.md)
else
    echo "Path to output directory is required!"
    exit 1
fi
