# Installation directory
INSTALL=

VERSION=0.1

#========================== No need to edit anything from here =========================

LIBDIR=${INSTALL}/lib

cd $INSTALL
rm -rf java
jar xvf $LIBDIR/ample-$VERSION.jar java/lang
mv java $1/jre/lib
cd $1/jre/lib
jar ufv rt.jar java/lang/ample/*
rm -rf java
