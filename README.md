# Dotfiles
All of my dotfiles, in a single repository. Supercedes the modular approach of one repository per use-case (`dot-elixir`, `dot-git`, etc.). Long live the monolith.

## Getting started

### Install Stow
Install [Stow](https://www.gnu.org/software/stow/). You could use MacPorts, but there's a bunch of stuff in here which assumes you're using Homebrew, so stick with that.

```sh
brew install stow
```

### Clone the dotfiles
Clone the dotfiles to your local machine. For example:

```sh
cd ~
mkdir code && cd $_
git clone git@github.com:monooso/dotfiles.git
```

### Install the dotfiles
Install the dotfiles.

```sh
cd ~/code
stow dotfiles
```
