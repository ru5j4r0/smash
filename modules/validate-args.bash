import echo-err

declare -Agr SMASH_TEST_OP=(
	['=']='-eq'
	['>=']='-ge'
	['>']='-gt'
	['<=']='-le'
	['<']='-lt'
	['!=']='-ne'
)

function validate-args() {
	if test ! "$SMASH_ARG_COUNT" "${SMASH_TEST_OP[$1]}" "$2"; then
		echo-err 'Invalid arguments'
		exit 1
	fi
}
