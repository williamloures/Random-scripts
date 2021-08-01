#!/usr/bin/env bash
for file in *.mkv
do
    mkvmerge -o output.mkv --split chapters:all "$file" && rm "$file"
done

for file in *.mkv
do
    TRACK=${file:8:2}
    ffmpeg -i "$file" -vn -c:a flac -sample_fmt s16 "$TRACK.flac"
    rm "$file"
done