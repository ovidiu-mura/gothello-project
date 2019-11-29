#!/bin/sh
mkdir -p runs

if ! [ -s runs/.run ]
then
    echo "1" >runs/.run
fi
RUN=`cat runs/.run`
echo `expr $RUN + 1` >runs/.run

SERIAL=1
DATE="`date --iso-8601=minutes`"

while true
do
    PREFIX="runs/$RUN-$SERIAL"
    mkdir -p $PREFIX
    echo "$DATE" >$PREFIX/date
    sleep 0.1
    java -jar Gthd.jar 0 >$PREFIX/gthd 2>&1 &
    sleep 0.1
    java -jar Grossthello.jar white localhost 0 3 log \
         >$PREFIX/white-output 2>$PREFIX/white-log &
    sleep 0.1
    java -jar Grossthello.jar black localhost 0 3 log \
         >$PREFIX/black-output 2>$PREFIX/black-log
    SERIAL=`expr $SERIAL + 1`
done
