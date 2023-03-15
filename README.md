# Dotfiles
All of my dotfiles, in a single repository. Supercedes the modular approach of one repository per use-case (`dot-elixir`, `dot-git`, etc.). Long live the monolith.

## Getting started

### Install Stow
Install [Stow](https://www.gnu.org/software/stow/), using your package manager of choice. For example:

```sh
# Homebrew
brew install stow

# MacPorts
sudo port install stow
```

### Clone the dotfiles
Clone the dotfiles to your local machine. For example:

```sh
cd ~
mkdir code && cd $_
git clone git@github.com:monooso/minimal-dotfiles.git
```

### Install the dotfiles
Install the dotfiles.

```sh
cd ~/code
stow dotfiles
```
