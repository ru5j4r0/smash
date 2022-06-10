import colored-echo

function echo-run() {
	colored-echo green "Running \"$*\" ..."
	"$@"
}
