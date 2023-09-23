info() {
  echo "ℹ️ $1"
}

success() {
  echo "✅ $1"
}

# Install Homebrew
info "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
success "Homebrew installed"

# Install Homebrew packages
info "Installing Homebrew packages..."

brew update && brew install \
  bat \
  curl \
  fd \
  fzf \
  git \
  lazygit \
  neovim \
  php \
  ripgrep \
  stow \
  tmux \
  tree \
  wget

success "Homebrew packages installed"

# Install fonts
info "Installing fonts..."

brew update && brew install \
  font-iosevka-ss15 \
  font-symbols-only-nerd-font

success "Fonts installed"

# Install asdf
info "Installing asdf..."
source bin/asdf/asdf/install.sh
success "asdf installed"

# Install asdf Node.js plugin
info "Installing asdf Node.js plugin..."
source bin/asdf/nodejs/install.sh
success "asdf Node.js plugin installed"

# Install Node.js LTS for use globally
info "Installing Node.js LTS..."
asdf plugin-update nodejs
asdf install nodejs lts
success "Node.js LTS installed"

# Install Composer globally
info "Installing Composer..."
source bin/composer/install.sh
success "Composer installed"

# Stow our dotfiles
info "Installing dotfiles..."
stow -t ~/ .
success "Dotfiles installed"

# Source the .zshrc
info "Sourcing .zshrc"
source ~/.zshrc
success "All done"
