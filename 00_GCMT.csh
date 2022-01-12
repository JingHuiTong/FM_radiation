#!/bin/csh
set URL="https://www.ldeo.columbia.edu/~gcmt/projects/CMT/catalog/jan76_dec20.ndk"
gmt which $URL -G
awk '/^PDE/ {Date=$2; Time=$3; Lat=$4; Long=$5; Depth=$6; Mag=$7; getline; Name=$1; getline; getline; Exp=$1; getline; mant=$11; strike1=$12; dip1=$13; rake1=$14; strike2=$15; dip2=$16; rake2=$17; print Long, Lat, Depth, Mag, strike1, dip1, rake1, strike2, dip2, rake2, mant, Exp, Date "T" Time, Name}' jan76_dec20.ndk | sed 's/\//-/g' > meca.gmt
gmt select meca.gmt -R-180/180/-90/90 > GCMT_1976-2020_meca.gmt