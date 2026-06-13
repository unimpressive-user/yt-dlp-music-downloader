#!/usr/bin/env bash

while true; do
  read -p "Enter download path: " DOWNLOAD_PATH
  read -p "Enter playlist URL: " PLAYLIST_URL

  echo "You entered:"
  echo "  Path: $DOWNLOAD_PATH"
  echo "  URL : $PLAYLIST_URL"
  echo
  read -p "Is this correct? (y/n): " CONFIRM

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
exit 1
