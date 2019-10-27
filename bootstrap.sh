#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "knife_bash_completion.sh" \
		--exclude "*.sublime*" \
		--exclude ".gitkeep" \
		-avh --no-perms . ~;
	#sed -i 's/tab/space/' ~/.editorconfig
	source ~/.bash_profile;
}

	doIt;
unset doIt;
