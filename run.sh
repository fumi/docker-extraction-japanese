#!/bin/bash -eu

DUMP_DIR="/work/extraction-framework/dump"

download() {
  cd $DUMP_DIR
  ../run download config=download.ja.properties
}

extract() {
  cd $DUMP_DIR &> /dev/null
  ../run extract extraction.ja.properties
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
