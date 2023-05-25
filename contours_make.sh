#!/bin/bash

STEP=$1

if [ -z $STEP ]; then
    echo "Need a step value"
    exit
fi

if [ $STEP -lt 10 ]; then
    echo "Invalid step: $STEP"
    exit
fi

source env.sh

SRC_DIR=$DATA_DIR/dem
DST_DIR=$BUILD_DIR/contours/$STEP

mkdir -p $DST_DIR

echo "making contours with step $STEP"

(cd $SRC_DIR && ls *hgt) | xargs -P 8 -I@@ ./contours_make_one.sh $STEP $SRC_DIR/@@ $DST_DIR/@@.shp
