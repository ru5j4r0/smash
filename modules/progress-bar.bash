function progress-bar() {
	local open=${2:0:1}
	local fill=${2:1:1}
	local empty=${2:2:1}
	local close=${2:3:1}
	local rate=$(($1 / 100 + 1))
	local max_rate=$(($1 / rate))

	stdbuf -i 0 -o 0 awk -v 'ORS=' "{ if (NR % $rate == 0) {
		print \"\r 0% $open\"
		for (i = NR / $rate; i > 0; --i) print \"$fill\"
		for (i = $max_rate - NR / $rate; i > 0; --i) print \"$empty\"
		print \"$close 100%\";
	}}" && echo
}
