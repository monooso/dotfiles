# Dotfiles
All of my dotfiles, in a single repository. Supercedes the modular approach of one repository per use-case (`dot-elixir`, `dot-git`, etc.). Long live the monolith.

## Getting started

### Clone the dotfiles
Clone the dotfiles to your local machine. For example:

```sh
cd ~
mkdir code && cd $_
git clone git@github.com:monooso/dotfiles.git
```

### Run the bootstrap script
Run the bootstrap script from the repository root. Assuming you followed the example above, and cloned the repository into `~/code/dotfiles`:

```sh
cd ~/code/dotfiles
bash bin/bootstrap.sh
```
