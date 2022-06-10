declare -Agr SMASH_NORMAL_COLORS=(
	['black']=30
	['red']=31
	['green']=32
	['yellow']=33
	['blue']=34
	['magenta']=35
	['cyan']=36
	['white']=37
)

declare -Agr SMASH_LIGHT_COLORS=(
	['black']=90
	['red']=91
	['green']=92
	['yellow']=93
	['blue']=94
	['magenta']=95
	['cyan']=96
	['white']=97
)

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
