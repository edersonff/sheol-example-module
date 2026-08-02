# video-thumbnail

Picks the frame with the most detail out of a video and saves it as a jpeg. Written to sit in the
middle of a longer pipeline, so it prints nothing when it works and leans on ffmpeg's own exit code
when it does not.

## Run it

    tools/thumbnail.sh input.mp4 cover.jpg

## What it needs

ffmpeg on PATH. Nothing else.

## What breaks

Measured on ffmpeg 8.0, not guessed:

- No arguments at all, exit 1, with a usage line on stderr.
- Input file that is not there, exit 254.
- A file that is not a video, exit 183.
- Output path you cannot write to, exit 243.
- Footage that is entirely black still succeeds, exit 0, and writes a 671 byte jpeg of nothing. The
  filter picks the sharpest frame available, and when every frame is identical it has no way to tell
  you the video was useless.
- Very short clips are fine. A 0.4 second clip gives a normal thumbnail.
