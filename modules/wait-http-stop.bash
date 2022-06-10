function wait-http-stop() {
	timeout "${2:-1m}" bash -c "
		while test \$(curl -s -I -o /dev/null -w '%{http_code}' 127.0.0.1:${1-80}) -eq '200'; do
			sleep 1s
		done
	" || return 1
}
