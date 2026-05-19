#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

###############################################################################
# Helpers                                                                     #
###############################################################################

brew_install() {
    for package in "$@"; do
        brew list --formula "$package" >/dev/null 2>&1 || brew install "$package"
    done
}

brew_cask_install() {
    for cask in "$@"; do
        brew list --cask "$cask" >/dev/null 2>&1 || brew install --cask "$cask"
    done
}

mas_install() {
    local app_id="$1"
    mas list | awk '{ print $1 }' | grep -qx "$app_id" || mas install "$app_id"
}

asdf_plugin_add() {
    local plugin="$1"
    asdf plugin list | grep -qx "$plugin" || asdf plugin add "$plugin"
}

asdf_install_global() {
    local plugin="$1"
    local version="$2"

    asdf install "$plugin" "$version"
    asdf global "$plugin" "$version"
}

###############################################################################
# Homebrew                                                                    #
###############################################################################

brew update
brew upgrade

BREW_PREFIX=$(brew --prefix)
export PATH="${BREW_PREFIX}/bin:${PATH}"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:${PATH}"

###############################################################################
# Command-line tools                                                          #
###############################################################################

brew_install \
    coreutils \
    moreutils \
    findutils \
    gnu-sed \
    wget \
    gnupg \
    vim \
    grep \
    openssh \
    screen \
    ack \
    curl \
    git \
    git-lfs \
    lua \
    lynx \
    p7zip \
    pigz \
    pv \
    rename \
    rlwrap \
    ssh-copy-id \
    telnet \
    tree \
    vbindiff \
    zopfli \
    readline \
    xz \
    jq

brew_install \
    asdf \
    python \
    mysql-client \
    direnv \
    awscli \
    jckuester/tap/awsls \
    cloc \
    cocoapods \
    ffmpeg \
    gh \
    glslang \
    neovim \
    planetscale/tap/pscale \
    swift-format \
    tursodatabase/tap/turso \
    uv \
    watchman \
    yt-dlp

###############################################################################
# Applications                                                                #
###############################################################################

# Some apps need Rosetta.
sudo softwareupdate --install-rosetta --agree-to-license

brew_cask_install \
    raycast \
    karabiner-elements \
    google-chrome \
    adobe-acrobat-reader \
    zoom \
    google-drive \
    transmission \
    vlc \
    discord \
    gimp \
    steam \
    battle-net \
    slack \
    microsoft-teams \
    visual-studio-code \
    figma \
    balenaetcher \
    docker-desktop \
    beekeeper-studio \
    altair-graphql-client \
    audacity \
    claude-code \
    codex \
    codex-app \
    cursor \
    firefox \
    ghostty \
    loom \
    ngrok \
    notion \
    sf-symbols \
    t3-code \
    wispr-flow

###############################################################################
# Mac App Store                                                               #
###############################################################################

brew_install mas

mas_install 1352778147 # Bitwarden
mas_install 497799835  # Xcode
mas_install 506189836  # Harvest
mas_install 441258766  # Magnet

sudo xcodebuild -license accept

###############################################################################
# Runtime managers                                                            #
###############################################################################

asdf_plugin_add nodejs
asdf_install_global nodejs latest:24
corepack enable
corepack prepare pnpm@latest --activate

asdf_plugin_add bun
asdf_install_global bun latest:1
bun install -g biome vercel eas-cli

asdf_plugin_add deno
asdf_install_global deno latest

###############################################################################
# Cleanup                                                                     #
###############################################################################

brew cleanup
