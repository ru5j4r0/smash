if test ! -v SMASH_QUIET; then
echo -e '\033[0;32mStart loading smash...\033[0;0m'
fi
SMASH_ORIGINAL_DIR=$PWD
mkdir -p ~/.local/share/ ~/.local/bin/
cd ~/.local/share/||(echo '\033[0;31m [Error] Failed to load smash.\033[0;0m'&&exit 1)
if test -d smash; then
cd smash||(echo '\033[0;31m [Error] Failed to load smash.\033[0;0m'&&exit 1)
if test "$(date +%w)" != "$(cat .smash_last_updated)"; then
date +%w>.smash_last_updated
git pull -q
fi
else
git clone -q git@github.com:ru5j4r0/smash.git
cd smash||(echo '\033[0;31m [Error] Failed to load smash.\033[0;0m'&&exit 1)
date +%w>.smash_last_updated
chmod 744 bin/*
ln -s "$PWD"/bin/* "$HOME"/.local/bin/
echo "$PATH"|grep '\.local/bin'>/dev/null||echo '\033[0;33m [Warn] You should add "~/.local/bin" to your PATH\033[0;0m'
fi
cd "$SMASH_ORIGINAL_DIR"||(echo '\033[0;31m [Error] Failed to load smash.\033[0;0m'&&exit 1)
unset SMASH_ORIGINAL_DIR
if test ! -v SMASH_QUIET; then
echo -e '\033[0;32mFinished loading smash!\033[0;0m'
fi
SMASH_ARG_COUNT=$#
readonly SMASH_ARG_COUNT
function import() {
for module in "$@"; do
if test ! -v SMASH_MODULE_"${module//-/_}"; then
source ~/.local/share/smash/modules/"$module.bash"
declare -g SMASH_MODULE_"${module//-/_}"=1
fi
done
}
