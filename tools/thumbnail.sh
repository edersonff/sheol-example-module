#!/usr/bin/env bash
set -euo pipefail

input="${1:?usage: thumbnail.sh <video> <output.jpg>}"
output="${2:?usage: thumbnail.sh <video> <output.jpg>}"

ffmpeg -loglevel error -i "$input" -vf "thumbnail=100" -frames:v 1 -y "$output"
