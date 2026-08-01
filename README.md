# video-thumbnail

Picks the frame with the most detail out of a video and saves it as a jpeg. Written to be the
thumbnail step of a longer pipeline, so it prints nothing and returns a non-zero code when it fails.

## Run it

    tools/thumbnail.sh input.mp4 cover.jpg

## What it needs

ffmpeg on PATH. Nothing else.

## What breaks

Videos shorter than one second give ffmpeg no frames to compare, and the script exits with code 1.
Very dark footage picks a frame that looks black but is still the sharpest one there is.
