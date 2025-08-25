#!/bin/bash
set -e
set -x

# If Wayland Experimental need to blank DISPLAY here to enable Wayland.
# NOTE: DISPLAY must be unset here before run_swift to work
#       Registry entrys are set in the container install or won't work.
if [ ! -z $WINE_EXPERIMENTAL_WAYLAND ]; then unset DISPLAY; fi

ZWIFT_HOME="/home/user/.wine/drive_c/Program Files (x86)/Zwift"
mkdir -p "$ZWIFT_HOME"
cd "$ZWIFT_HOME"

if [ "$1" = "update" ] || [ ! "$(ls -A .)" ] ; then
    /bin/update_zwift.sh "$@"
else
    /bin/run_zwift.sh "$@"
fi
