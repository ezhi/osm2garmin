#!/bin/bash

source env.sh

TYP=osm
SRC_DIR=$BUILD_DIR/osm/split
OUT_DIR=$BUILD_DIR/osm/img

mkdir -p $OUT_DIR
cd $OUT_DIR

if [ -z $DEM_DIR ]; then
    DEM_DIR=$DATA_DIR/dem
fi

mkgmap \
    --dem=$DEM_DIR \
    --unicode \
    --route \
    --gmapsupp \
    --family-id=909 \
    --name-tag-list="name:ru,name,int_name" \
    --order-by-decreasing-area \
    --read-config=$SRC_DIR/template.args \
    --style-file=$STYLE_DIR/style \
    $STYLE_DIR/$TYP.txt 2>&1 | tee log.txt
