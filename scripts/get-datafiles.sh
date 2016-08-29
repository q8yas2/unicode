#!/bin/bash

set -e

TARGET_DIR="$1/www/data/"
NAMESLIST_TARGET="$TARGET_DIR/NamesList.txt"
BLOCKS_TARGET="$TARGET_DIR/Blocks.txt"
CONFUSABLES_TARGET="$TARGET_DIR/confusables.txt"
NAMESLIST_URL="ftp://www.unicode.org/Public/9.0.0/ucd/NamesList.txt"
BLOCKS_URL="ftp://www.unicode.org/Public/9.0.0/ucd/Blocks.txt"
CONFUSABLES_URL="ftp://ftp.unicode.org/Public/security/9.0.0/confusables.txt"

function download() {
    if [ ! -f "$2" ] ; then
        echo "fetching $(basename $2)"
        wget -O "$2" "$1"
    fi
}

if [ ! -d "$TARGET_DIR" ] ; then
    echo "TARGET_DIR does not exist: $TARGET_DIR"
    exit 1
fi


download $NAMESLIST_URL $NAMESLIST_TARGET
download $BLOCKS_URL $BLOCKS_TARGET
download $CONFUSABLES_URL $CONFUSABLES_TARGET