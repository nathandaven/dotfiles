#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Download Youtube Video (yt-dlp)
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

# Documentation:
# @raycast.description Downloads with yt-dlp at max resolution to download folder in mp4
# @raycast.author Nathan Davenport

cd "$HOME/Downloads"
echo "Downloading video link $1"
yt-dlp --format 'bestvideo[height<=2160]+bestaudio' --merge-output-format mkv --recode-video mp4 "$1"
echo "Complete, see ~/Downloads"
