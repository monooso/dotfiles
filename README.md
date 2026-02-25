# Dotfiles
All of my dotfiles, in a single repository. Supersedes the modular approach of one repository per use-case (`dot-elixir`, `dot-git`, etc.). Long live the monolith.

Sensitive configuration (SSH configs, environment secrets, private snippets) lives in a separate private repository, [`dotfiles-private`](https://github.com/monooso/dotfiles-private). Desktop environment-specific configuration (e.g. GNOME dconf settings) lives in its own repo, such as [`dotfiles-gnome`](https://github.com/monooso/dotfiles-gnome). All repos are deployed to `$HOME` using GNU Stow.

## Requirements
- [GNU Stow](https://www.gnu.org/software/stow/) for managing symlinks. You'll need a reasonably recent version. This isn't a problem if you're on Fedora (using `dnf`); I can't speak for any other systems.
- Access to the [`dotfiles-private`](https://github.com/monooso/dotfiles-private) repo (for the full setup).
- A DE-specific dotfiles repo if applicable (e.g. [`dotfiles-gnome`](https://github.com/monooso/dotfiles-gnome)).

## Getting started

### Clone the repositories

```sh
mkdir -p ~/code && cd ~/code
git clone git@github.com:monooso/dotfiles.git
git clone git@github.com:monooso/dotfiles-private.git
git clone git@github.com:monooso/dotfiles-gnome.git  # if using GNOME
```

### Symlink everything

```sh
cd ~/code/dotfiles && stow -t ~/ .
cd ~/code/dotfiles-private && stow -t ~/ .
cd ~/code/dotfiles-gnome && stow -t ~/ .  # if using GNOME
```

## What goes where

| Repository         | Contents                                                    |
|--------------------|-------------------------------------------------------------|
| `dotfiles` (this)  | Shell config, tmux, editor settings, and other non-sensitive configuration |
| `dotfiles-private` | SSH configs, environment secrets, snyp snippets             |
| `dotfiles-gnome`   | GNOME dconf settings                                        |

If you're adding new configuration, ask yourself: (1) is it DE-specific? If so, it belongs in the relevant DE repo. (2) Would you be comfortable with it being public? If not, it belongs in `dotfiles-private`.
