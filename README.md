# John's dotfiles

For the longest time I had been forking https://github.com/mathiasbynens/dotfiles
for my dotfiles. However, I wanted to play around with ZSH and oh-my-zsh as an
alternative to bash 4+. This is an attempt to pair down Mathias' work to be
more focused on what I need.

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

**Assumption:** You are running on a Mac with ZSH as your default shell. More work may come later to support these dotfiles on Linux and Windows.

### Oh-My-ZSH

These dotfiles rely on oh-my-zsh to be present on the system. Install [oh-my-zsh](https://ohmyz.sh) following the instructions there.

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Code/dotfiles`, with `~/dotfiles` as a symlink.) The `sync-dotfiles.sh` script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/mathiasbynens/dotfiles.git && cd dotfiles && source sync-dotfiles.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source sync-dotfiles.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source sync-dotfiles.sh
```

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="John Slemmer"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="my@email.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to fork this repository instead, though.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./setup-mac.sh
```

### Install Stuff, a lot of stuff

When setting up a new Mac, you may want to install some common CLI utilities, apps, and more.  For this you will need to install [Homebrew](https://brew.sh).

```bash
./install-stuff.sh
```

Some of the functionality of these dotfiles depends on formulae installed by `brew.sh`. If you don’t plan to run `brew.sh`, you should look carefully through the script and manually install any particularly important ones. A good example is Bash/Git completion: the dotfiles use a special version from Homebrew.

# TODOs

- do we need to setup the path to point to GNU utils?
- make a linux work
- make a linux work
- make a windows work
- any issues with .zshrc and .zprofile?
