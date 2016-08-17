#!/bin/bash -eu

DUMP_DIR="/work/extraction-framework/dump"

error() {
}

download() {
  pushd DUMP_DIR &> /dev/null
  ../run download config=download.ja.properties
  popd &> /dev/null
}

extract() {
  pushd DUMP_DIR &> /dev/null
  ../run extract extraction.ja.properties
  popd &> /dev/null
}


RUN_CMD=$1
#shift away /run.sh args got use the rest as args for the download script
shift

case $RUN_CMD in
    all)
        download
        extract
    ;;
    download)
        download
    ;;
    extract)
        extract
    ;;
    *)
        echo "unknown predefined action (action choice: all, download, extract)"
        exit 1
    ;;
esac
