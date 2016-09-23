# Python 3.5+ only

import shlex
import subprocess
from pathlib import Path


inputDir = input(
    "Directory of files to convert (relative or absolute path):\n"
    ">> "
)
fileInput = input(
    "File extension to convert:\n"
    ">> "
)
ffmpegArgs = input(
    "ffmpeg arguments (No need to specify input or output files)\n"
    "Example: -c:v libx264 -preset veryslow -c:a copy -c:s copy\n"
    ">> "
)
fileOutput = input(
    "Extension to output to:\n"
    ">> "
)
ffmpegBin = ["ffmpeg", "-i"]
ffmpegArgs = shlex.split(ffmpegArgs)

p = Path(inputDir)

for f in p.glob('*.{}'.format(fileInput)):
    ffmpegIn = [
        "{}".format(f)
    ]

    # if input and output filetypes are the same, append "-c" to output name
    # to avoid name clashes
    if fileInput == fileOutput:
        ffmpegOut = [
            "{}".format(
                '.'.join(str(f).split('.')[:-1]) +
                "-c.{}".format(fileOutput)
            )
        ]
    # no name clashes
    else:
        ffmpegOut = [
            "{}".format(
                '.'.join(str(f).split('.')[:-1]) +
                ".{}".format(fileOutput)
            )
        ]
    subprocess.run(
        ffmpegBin + ffmpegIn + ffmpegArgs + ffmpegOut,
        stdout=subprocess.PIPE
    )
