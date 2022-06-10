import colored-echo

function echo-err() {
	colored-echo red "$*" 1>&2
}
