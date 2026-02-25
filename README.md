# Dotfiles
All of my dotfiles, in a single repository. Supersedes the modular approach of one repository per use-case (`dot-elixir`, `dot-git`, etc.). Long live the monolith.

Sensitive configuration (SSH configs, environment secrets, private snippets) lives in a separate private repository, [`dotfiles-private`](https://github.com/monooso/dotfiles-private). Both repos are deployed to `$HOME` using GNU Stow.

## Requirements
- [GNU Stow](https://www.gnu.org/software/stow/) for managing symlinks. You'll need a reasonably recent version. This isn't a problem if you're on Fedora (using `dnf`); I can't speak for any other systems.
- Access to the [`dotfiles-private`](https://github.com/monooso/dotfiles-private) repo (for the full setup).

## Getting started

### Clone both repositories

```sh
mkdir -p ~/code && cd ~/code
git clone git@github.com:monooso/dotfiles.git
git clone git@github.com:monooso/dotfiles-private.git
```

### Symlink everything

```sh
cd ~/code/dotfiles && stow -t ~/ .
cd ~/code/dotfiles-private && stow -t ~/ .
```

## What goes where

| Repository         | Contents                                                    |
|--------------------|-------------------------------------------------------------|
| `dotfiles` (this)  | Shell config, tmux, editor settings, and other non-sensitive configuration |
| `dotfiles-private` | SSH configs, environment secrets, snyp snippets             |

If you're adding new configuration, ask yourself whether you'd be comfortable with it being public. If not, it belongs in `dotfiles-private`.
