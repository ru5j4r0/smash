function wait-http-start() {
	timeout "${2:-1m}" bash -c "
		while test \$(curl -s -I -o /dev/null -w '%{http_code}' 127.0.0.1:${1-80}) -ne '200'; do
			sleep 1s
		done
	" || return 1
}
