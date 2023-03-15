if [ -f $HOME/.asdf/asdf.sh ] && command -v brew &> /dev/null
then
  asdf plugin remove nodejs
  brew uninstall gawk gpg
  brew cleanup
else
  echo "Unable to uninstall Node.js. Check that both asdf and Homebrew are installed."
  exit 1
fi

