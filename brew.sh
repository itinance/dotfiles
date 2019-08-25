#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

brew tap Homebrew/bundle

brew bundle --global

# Set up GNU core utilities (those that come with OS X are outdated).
echo 'Be sure to add `$(brew prefix coreutils|findutils|gnu-sed)/libexec/gnubin` to `$PATH`.'
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

if ! grep -Fq "$BREW_PREFIX/bin/bash" /etc/shells; then
  echo "$BREW_PREFIX/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "$BREW_PREFIX/bin/bash";
fi;

# Set up Solarized Light syntax highlighting for bat
BAT_THEMES_DIR="$(bat cache --config-dir)/themes"
if [ ! -d "$BAT_THEMES_DIR" ]; then
  mkdir -p "$BAT_THEMES_DIR"
  git -C "$BAT_THEMES_DIR" clone --quiet https://github.com/braver/Solarized
  git -C "$BAT_THEMES_DIR" checkout 87e01090cf
fi
