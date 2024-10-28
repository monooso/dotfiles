# Dotfiles
All of my dotfiles, in a single repository. Supercedes the modular approach of one repository per use-case (`dot-elixir`, `dot-git`, etc.). Long live the monolith.

## Requirements
Uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks. You'll need a reasonably recent version. This isn't a problem if you're on Fedora (using `dnf`) or macOS (using `brew`); I can't speak for any other systems.

## Getting started

### Clone the dotfiles
Clone the dotfiles to your local machine. For example:

```sh
cd ~
mkdir code && cd $_
git clone git@github.com:monooso/dotfiles.git
```

### Symlink the dotfiles

```sh
cd ~/code/dotfiles
stow -t ~/ .
```
