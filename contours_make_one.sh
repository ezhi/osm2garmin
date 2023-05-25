#!/bin/sh

STEP=$1
SRC=`realpath $2`
DST=`realpath $3`

rm -f $DST
rm -f $DST.osm.pbf

gdal_contour -a ele -i $STEP $SRC $DST
cd ogr2osm
python3.11 -m ogr2osm -t trans_dem.py --pbf --no-memory-copy --gis-order $DST -o $DST.osm.pbf
