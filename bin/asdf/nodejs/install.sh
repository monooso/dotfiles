# Only run if asdf and Homebrew are installed
if [ -f $HOME/.asdf/asdf.sh ] && command -v brew &> /dev/null
then
  brew install gawk gpg
  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
else
  echo "Unable to install Node.js. Check that both asdf and Homebrew are installed."
  exit 1
fi
