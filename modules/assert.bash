import echo-err

function smash-set-context() {
	declare -g SMASH_CONTEXT="$1"
}

function smash-unset-context() {
	unset SMASH_CONTEXT="$1"
}

function assert() {
	coproc CAT { cat; }
	{
		eval "$@"
		local -r res=$?
		echo 1>&2
	} 2>&"${CAT[1]}"

	read -r -u "${CAT[0]}"
	declare errs=("$REPLY")
	while read -t 0 -r -u "${CAT[0]}"; do
		read -r -u "${CAT[0]}"
		if test -n "$REPLY"; then
			errs+=("$REPLY")
		fi
	done
	kill "$CAT_PID"

	if test $res -ne 0; then
		if test -n "$SMASH_CONTEXT"; then
			echo-err " [Error] During $SMASH_CONTEXT:"
		else
			echo-err ' [Error] An error occurred:'
		fi
		echo-err "\tFailed command: $*"
		if test -n "${errs[0]}"; then
			echo-err "\tError messages:"
			for err in "${errs[@]}"; do
				echo-err "\t\t- $err"
			done
		fi
		exit 1
	fi
}
