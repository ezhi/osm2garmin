#!/bin/sh

source env.sh

OUT_DIR=$BUILD_DIR/contours
cd $OUT_DIR

for STEP in `ls`; do
    (
        mkdir -p $STEP/img
        cd $STEP/img
        mkgmap \
            --style-file=$STYLE_DIR/contour \
            --net --gmapsupp --tdbfile \
            --family-id=909 --product-id=1 \
            --draw-priority=28 --transparent \
            --series-name=SRTM$STEP --family-name=SRTM$STEP \
            --description=SRTM-$STEP \
            --mapname=`expr 21000000 + $STEP \* 100` \
            ../*osm.pbf
    )
done
