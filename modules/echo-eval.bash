import colored-echo

function echo-eval() {
	colored-echo green "Running \"$*\" ..."
	eval "$@"
}
