import assert

SMASH_DIR_HERE=$(dirname "${BASH_SOURCE[-1]}")
readonly SMASH_DIR_HERE

function cd-here() {
	assert cd "$SMASH_DIR_HERE"
}
