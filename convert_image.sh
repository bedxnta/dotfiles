#!/bin/bash

# Get the list of file formats to which the image can be converted
FORMAT=$(zenity --list --title="Convert Image" --text="Choose output format:" --column="Formats" PNG JPEG GIF)

if [ -z "$FORMAT" ]; then
    # If no format is selected, exit the script
    exit 1
fi

for FILE in "$@"
do
    # Get the file name without the extension
    FILENAME=$(basename "$FILE")
    BASENAME="${FILENAME%.*}"

    # Convert the image to the selected format
    convert "$FILE" "$BASENAME.$(echo $FORMAT | tr '[:upper:]' '[:lower:]')"
done
