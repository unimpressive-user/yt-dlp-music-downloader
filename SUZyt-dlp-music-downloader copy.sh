#!/usr/bin/env bash

set -e

while true; do
  echo
  read -rp "Enter download path: " DOWNLOAD_PATH
  read -rp "Enter playlist URL: " PLAYLIST_URL

  echo
  echo "You entered:"
  echo "  Path: $DOWNLOAD_PATH"
  echo "  URL : $PLAYLIST_URL"
  echo
  read -rp "Is this correct? (y/n): " CONFIRM

  case "$CONFIRM" in
    y|Y)
      break
      ;;
    n|N)
      echo "Okay, let's try again."
      ;;
    *)
      echo "Please answer y or n."
      ;;
  esac
done

mkdir -p "$DOWNLOAD_PATH"

yt-dlp \
  -f "bestaudio[ext=m4a]" \
  -N 5 \
  -o "%(title)s.%(ext)s" \
  --embed-thumbnail \
  --paths "$DOWNLOAD_PATH" \
  --download-archive "$DOWNLOAD_PATH/.downloaded.txt" \
  "$PLAYLIST_URL"

exit
