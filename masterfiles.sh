#!/bin/bash
source config.sh
for book in "${translation}"/*/;
do
  bookname=`basename "$book"`
  for chapter in "${book}"*/;
  do
    chaptername=`basename "$chapter"`
    # echo $chapter
    # echo $chaptername
    echo "[[$chaptername]]" >> "$book$bookname-tmp.md"
    sort -k 2n "$book$bookname-tmp.md" > "$book$bookname.md"
  done;
done;
find . -name *-tmp.md -exec rm -rf {} \;
