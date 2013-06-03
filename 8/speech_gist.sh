#!/bin/bash
 
readonly LNG=${LNG:=en}
readonly URL="http://translate.google.com/translate_tts?tl=${LNG}&q="
readonly STOCK="${HOME}/.${0##*/}"
 
which mplayer &>/dev/null || {
echo "error: mplayer not installed"
exit
}
 
which wget &>/dev/null || {
echo "error: wget not installed"
exit
}
 
[ -d "${STOCK}/${LNG}" ] || {
mkdir -p "${STOCK}/${LNG}" || {
echo "error: cannot create speech stock \"$STOCK\""
exit
}
}
 
ARGS=${*:-`cat`}
TEXT=${ARGS// /+}
FILE="`echo "$TEXT" | md5sum`"
FILE=${FILE%% *}
FILE="${STOCK}/${LNG}/${FILE}"
 
[ -f "${FILE}" ] ||
    wget -q -U Mozilla -O "${FILE}" "${URL}${TEXT}"

mplayer "${FILE}" &>/dev/null
