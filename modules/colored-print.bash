import colors

function colored-print() {
	if test "$1" = 'light'; then
		shift
		local -r c=${SMASH_LIGHT_COLORS["$1"]}
	else
		local -r c=${SMASH_NORMAL_COLORS["$1"]}
	fi
	shift
	printf "\033[0;%dm$*\033[0;0m" "$c"
}
