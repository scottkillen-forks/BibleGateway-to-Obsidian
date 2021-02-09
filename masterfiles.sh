#!/bin/bash
for book in ESV/*/;
do
  bookname=`basename "$book"`
  bookname="${bookname:5}"
  for chapter in "${book}"*/;
  do
    chaptername=`basename "$chapter"`
    echo "[[$chaptername]]" >> "$book$bookname.md"
    for verse in "${chapter}"*.md;
    do
      versefile=`basename "$verse"`
      verse="`echo $versefile | rev | cut -c4- | rev`"
      echo "$verse"
      echo "[[$verse]]" >> "$chapter$chaptername.md"
    done;
  done;
done;
