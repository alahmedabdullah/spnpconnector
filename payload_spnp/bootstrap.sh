#!/bin/sh
# version 2.0

yum -y update
yum install -y gcc glibc.i686 unzip

WORK_DIR=`pwd`

SPNP_PACKAGE_NAME=$(sed 's/SPNP_PACKAGE_NAME=//' $WORK_DIR/package_metadata.txt)
cp $WORK_DIR/$SPNP_PACKAGE_NAME /opt

cd /opt/
unzip $SPNP_PACKAGE_NAME
rm $SPNP_PACKAGE_NAME

cd $WORK_DIR
