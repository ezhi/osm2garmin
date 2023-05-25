#!/bin/bash

OUT_DIR=data/osm

mkdir -p $OUT_DIR
cd $OUT_DIR

while read f; do
    echo $f
    DIR=`dirname $f`
    mkdir -p $DIR
    if [ ! -f $f ]; then
        (cd $DIR && curl -C - -O https://download.geofabrik.de/$f.osm.pbf)
    fi
done
