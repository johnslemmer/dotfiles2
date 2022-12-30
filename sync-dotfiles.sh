#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

# TODO(JS) remove below bin when we actually have binaries to copy over
function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude ".editorconfig" \
		--exclude "bin" \
		--exclude ".vscode" \
		--exclude "install-stuff.sh" \
		--exclude "sync-dotfiles.sh" \
		--exclude "setup-mac.sh" \
		-avh --no-perms . ~;
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
	doIt;
else
	read -q "?This may overwrite existing files in your home directory. Are you sure? (y/n) ";
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
        echo "";
        echo "You must restart your shell for all changes to take effect.";
	fi;
fi;
unset doIt;
