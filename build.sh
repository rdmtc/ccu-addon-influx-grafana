#!/bin/bash

INFLUX_URL=https://dl.influxdata.com/influxdb/releases/influxdb-1.7.0_linux_armhf.tar.gz
CHRONO_URL=https://dl.influxdata.com/chronograf/releases/chronograf-1.7.1_linux_armhf.tar.gz
GRAFANA_URL=https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.3.2.linux-armv7.tar.gz

BUILD_DIR=`cd ${0%/*} && pwd -P`

ADDON_FILES=$BUILD_DIR/addon_files
ADDON_TMP=$BUILD_DIR/addon_tmp

rm -r $ADDON_TMP

mkdir $ADDON_TMP 2> /dev/null || rm -r $ADDON_TMP/*

echo "download and extract InfluxDB $INFLUX_URL ..."
curl --silent $INFLUX_URL | gtar -xzf - --strip-components=2 -C $ADDON_TMP

echo "download and extract Chronograph $CHRONO_URL ..."
curl --silent $CHRONO_URL | gtar -xzf - --strip-components=2 -C $ADDON_TMP

echo "download and extract Grafana $GRAFANA_URL ..."
curl --silent $GRAFANA_URL | gtar -xzf - --strip-components=1 -C $ADDON_TMP


echo "copying files to tmp dir..."
cp -r $ADDON_FILES/* $ADDON_TMP/
