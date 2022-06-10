if test ! -v SMASH_QUIET; then
echo -e '\033[0;32mStart loading smash...\033[0;0m'
fi
if test ! -d ~/.local/share/; then
mkdir -p ~/.local/share/
fi
cd ~/.local/share/ || exit 1
if test -d smash; then
cd smash || exit 1
if test "$(date +%w)" != "$(cat .smash_last_updated)"; then
date +%w > .smash_last_updated
git pull
fi
else
git clone -q git@github.com:ru5j4r0/smash.git
cd smash || exit 1
date +%w > .smash_last_updated
chmod 744 bin/*
ln -s "$PWD"/bin/* "$HOME"/.local/bin/
fi
if test ! -v SMASH_QUIET; then
echo -e '\033[0;32mFinished loading smash!\033[0;0m'
fi
function import() {
for module in "$@"; do
if test ! -v SMASH_MODULE_"${module//-/_}"; then
source ~/.local/share/smash/modules/"$module.bash"
declare -g SMASH_MODULE_"${module//-/_}"=1
fi
done
}
