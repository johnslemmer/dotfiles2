#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
# brew install bash
# brew install bash-completion2

# Switch to using brew-installed bash as default shell
# if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
#   echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
#   chsh -s "${BREW_PREFIX}/bin/bash";
# fi;

# Install `wget`
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install curl
brew install git
brew install git-lfs
# brew install gs
# brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install telnet
brew install tree
brew install vbindiff
brew install zopfli
brew install readline
brew install xz
brew install jq

# Other dev tools
brew install asdf
brew install python
brew install node
brew install deno
brew install yarn
brew install pnpm
brew install direnv
# not sure we need python yet
# brew install python@2
# brew install pyenv
# brew install pipenv
# brew install watchman
# brew install azure-cli
# brew install postgres

# DVD ripping
# can't do illegal things at work
# brew install libdvdcss

# Others???


# APPLICATIONS

# Some apps need rosetta:
sudo softwareupdate --install-rosetta

# essentials
brew install karabiner-elements
brew install google-chrome
brew install openoffice
brew install adobe-acrobat-reader
brew install zoom
brew install google-drive
# brew install dropbox

# app store essenatials
# install mas (the command line mac app store installer)
brew install mas
# install magnet
mas install 441258766
# install bitwarden
mas install 1352778147

# personal
# brew install spotify
# brew install handbrake
brew install --cask transmission
brew install vlc
# brew install kindle
# brew install chrome-remote-desktop-host
brew install discord
brew install gimp
brew install steam
brew install battle-net

# dev: general
brew install slack
brew install visual-studio-code
brew install figma
# brew install sourcetree
brew install balenaetcher
# brew install clipy
brew install kap
# brew install --cask wireshark
# brew install postman
# install xcode
mas install 497799835
sudo xcodebuild -license accept

# dev: apps
# probably not doing any android mobile development
# brew install android-studio
# brew install genymotion

# dev: server
# brew install graphql-playground
# brew install --cask docker
brew install beekeeper-studio
brew install planetscale/tap/pscale
brew install mysql-client

# westell
# brew install tunnelblick
# brew install virtualbox
# brew install perforce
# brew install p4v
# brew install mimecast
# brew install mailraider pro
# brew install vmware-horizon-client
# brew install manageengine-mibbrowser

# contracting
# install harvest
mas install 506189836
# brew install skype
# brew install skype meetings app

# Remove outdated versions from the cellar.
brew cleanup

# ASDF SETUP

# asdf plugin add ruby
# asdf install ruby 2.4.6
# asdf install ruby 2.6.0
# asdf install ruby 2.6.6
# asdf install ruby latest
# asdf global ruby system
asdf plugin add nodejs
asdf install nodejs latest:20
asdf global nodejs latest:20
asdf plugin add bun
asdf install bun latest:1
asdf global bun latest:1


# PYTHON MODLES

# dev
# not sure we need python yet testing
# pip2 install --upgrade pip
# pip2 install --upgrade setuptools
# pip2 install pylint
#curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
#poetry completions bash > $(brew --prefix)/etc/bash_completion.d/poetry.bash-completion

