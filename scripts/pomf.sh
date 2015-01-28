#!/bin/sh
# requires: POSIX sh, curl, jq
# thanks to clsr

upload () {
	res="$(curl --progress-bar -F "files[]=@\"$1\"" 'http://pomf.se/upload.php')" || return $?
	path="$(printf %s "$res" | jq -c -r '.files[0].url')" || return $?
	echo "http://a.pomf.se/$path"
}

[ $# -eq 0 ] && upload -

for f do
	url="$(upload "$f")" && echo "$f: $url"
done
