#!/bin/bash

source env.sh

OUT_DIR=$BUILD_DIR/osm/split
SOURCES=`cat sources.txt | grep -v '^#' | sed -e 's/$/.osm.pbf/'`

echo "splitting $SOURCES to $OUT_DIR"

rm -rf $OUT_DIR
mkdir -p $OUT_DIR

cd data/osm
splitter --keep-complete=false --output-dir=$OUT_DIR $SOURCES
