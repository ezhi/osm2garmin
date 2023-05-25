source env.sh

OUT_DIR=$BUILD_DIR/img

mkdir -p $OUT_DIR
cd $OUT_DIR

mkgmap --gmapsupp $BUILD_DIR/{osm,contours/*}/img/gmapsupp.img
