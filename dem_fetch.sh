source env.sh

LS=$DATA_DIR/dem/ls.txt
OUT_DIR=$DATA_DIR/dem

if [ ! -f $LS ]; then
    aws s3 ls s3://raster/NASADEM/ --recursive --endpoint-url https://opentopography.s3.sdsc.edu --no-sign-request > $LS
fi

FILES=`perl -lne 'if (/file (.*?)\.hgt/) { print lc $1 }' $BUILD_DIR/osm/img/log.txt`

mkdir -p $OUT_DIR
cd $OUT_DIR

for f in $FILES; do
    [ -f $f.hgt ] && continue
    filename=NASADEM_HGT_$f.tif
    grep $filename $LS > /dev/null || continue
    echo $filename
    aws s3 cp s3://raster/NASADEM/NASADEM_be/$filename . --endpoint-url https://opentopography.s3.sdsc.edu --no-sign-request
    gdal_translate -of SRTMHGT $filename $f.hgt
done
