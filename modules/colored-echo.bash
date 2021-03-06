import colors

function colored-echo() {
	if test "$1" = 'light'; then
		shift
		local -r c=${SMASH_LIGHT_COLORS["$1"]}
	else
		local -r c=${SMASH_NORMAL_COLORS["$1"]}
	fi
	shift
	echo -e "\033[0;${c}m$*\033[0;0m"
}
