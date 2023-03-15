# Only run if Homebrew is installed
if command -v brew &> /dev/null
then
  brew install coreutils curl git
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.2
else
  echo "Unable to install asdf. Check that Homebrew is installed."
  exit 1
fi
