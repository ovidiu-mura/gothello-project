#!/bin/sh
for NAME in Grossthello Gthd
do
    (
        NPATH=../../gothello-`echo $NAME | tr 'A-Z' 'a-z'`
        cd $NPATH &&
        rm -f *.class &&
        javac $NAME.java &&
        jar -ce $NAME *.class >../gothello-project/data/$NAME.jar
    )
done
