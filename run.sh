#!/bin/bash -eu

EXTRACTION_DIR="/work/extraction-framework"
CORE_DIR="$EXTRACTION_DIR/core"
DUMP_DIR="$EXTRACTION_DIR/dump"

prepare() {
  cd $CORE_DIR &> /dev/null
  ../run download-ontology
  ../run download-mappings
}

download() {
  cd $DUMP_DIR &> /dev/null
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
        prepare
        extract
    ;;
    download)
        download
    ;;
    extract)
        extract
    ;;
    prepare-and-extract)
        prepare
        extract
    ;;
    *)
        echo "unknown predefined action (action choice: all, download, extract)"
        exit 1
    ;;
esac
