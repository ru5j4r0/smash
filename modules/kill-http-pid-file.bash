import wait-http-stop

function kill-http-pid-file() {
	if test -f "$1"; then
		kill "$(cat "$1")"
		wait-http-stop "$2" || return 1
		if test -f "$1"; then
			rm "$1"
		fi
	fi
}
