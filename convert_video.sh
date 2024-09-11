#!/bin/bash

# Display a dialog box to choose the output format
FORMAT=$(zenity --list --title="Convert Video" --text="Choose output format:" --column="Formats" MP4 AVI MKV MOV)

if [ -z "$FORMAT" ]; then
    # If no format is selected, exit the script
    exit 1
fi

for FILE in "$@"
do
    # Get the file name without the extension
    FILENAME=$(basename "$FILE")
    BASENAME="${FILENAME%.*}"

    # Convert the video to the selected format
    case "$FORMAT" in
        MP4)
            ffmpeg -i "$FILE" -c:v copy -c:a aac -b:a 192k "$BASENAME.mp4"
            ;;
        AVI)
            ffmpeg -i "$FILE" -c:v libxvid -q:v 4 -c:a libmp3lame -b:a 192k "$BASENAME.avi"
            ;;
        MKV)
            ffmpeg -i "$FILE" -c:v copy -c:a copy "$BASENAME.mkv"
            ;;
        MOV)
            ffmpeg -i "$FILE" -c:v libx264 -c:a aac -b:a 192k "$BASENAME.mov"
            ;;
    esac
done
