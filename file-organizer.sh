#!/bin/bash

# Directories
IMAGE_DIR="/home/dev-test/images"
DOC_DIR="/home/dev-test/documents"
VIDEO_DIR="/home/dev-test/videos"
OTHER_DIR="/home/dev-test/others"

# Ensure directories exist or create them
mkdir -p "$IMAGE_DIR" || { echo "Cannot create $IMAGE_DIR"; exit 1; }
mkdir -p "$DOC_DIR" || { echo "Cannot create $DOC_DIR"; exit 1; }
mkdir -p "$VIDEO_DIR" || { echo "Cannot create $VIDEO_DIR"; exit 1; }
mkdir -p "$OTHER_DIR" || { echo "Cannot create $OTHER_DIR"; exit 1; }

# File processing logic
for file in /home/dev-test/*; do
  if [ -f "$file" ]; then
    case "$file" in
      *.jpg|*.png|*.jpeg)
        mv "$file" "$IMAGE_DIR"
        ;;
      *.pdf|*.doc|*.docx)
        mv "$file" "$DOC_DIR"
        ;;
      *.mp4|*.avi|*.mov)
        mv "$file" "$VIDEO_DIR"
        ;;
      *)
        mv "$file" "$OTHER_DIR"
        ;;
    esac
  fi
done

echo "Files have been organized by file type."
