import colored-echo

function echo-err() {
	colored-echo red "\033[0;31m$*\033[0;0m" 1>&2
}
