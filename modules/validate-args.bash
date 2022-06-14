import echo-err

function validate-args() {
	if test "$SMASH_ARG_COUNT" != "$1"; then
		echo-err 'Invalid arguments'
		exit 1
	fi
}
