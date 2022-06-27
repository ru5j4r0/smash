import colored-echo colored-print

function echo-task() {
	colored-print blue "$1 ... "
	shift
	eval "$@"
	if test $? -eq 0; then
		colored-echo blue 'OK!'
	else
		colored-echo red 'Failed!'
		exit 1
	fi
}
