#!/bin/bash
for folder in ESV/*/;
do
  for file in "${folder}"*.md;
  do
    filename=${file##*/};
    bookchapter="`echo $filename | rev | cut -c4- | rev`"
    echo "![[${folder$bookchapter}]]" >> "${folder}/${folder:5}.md"
    echo "$folder$bookchapter.md"
    while IFS= read -r line
    do
      if [[ ${line:0:1} == "v" ]];
      then
        verse="`grep -o '^v[0-9]*' <<<$line`"
        text="`cut -d ' ' -f2- <<<$line`"
        num="${verse:1}"
        if [ ! -d "$folder$bookchapter" ]; then
          mkdir "$folder$bookchapter"
        fi
        echo "$text" > "$folder$bookchapter/$bookchapter.$num.md"
        echo "![[$bookchapter.$num]]" >> "$folder$bookchapter/$bookchapter.md"
      fi
    done < "$folder$bookchapter.md"
    rm "$folder$bookchapter.md"
  done;
done;
