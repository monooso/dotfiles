info() {
  echo "ℹ️ $1"
}

success() {
  echo "✅ $1"
}

# Install Homebrew
info "Installing Homebrew..."
source bin/bootstrap/install_homebrew.sh
success "Homebrew installed"

# Install Homebrew packages
info "Installing Homebrew packages..."
source bin/bootstrap/install_homebrew_packages.sh
success "Homebrew packages installed"

# Install fonts
info "Installing fonts..."
source bin/bootstrap/install_homebrew_fonts.sh
success "Fonts installed"

# Install Composer globally
info "Installing Composer..."
source bin/bootstrap/install_composer.sh
success "Composer installed"

# Stow our dotfiles
info "Installing dotfiles..."
stow -t ~/ .
success "Dotfiles installed"

# Source the .zshrc
# @todo Update this to install set up and use Fish.
info "Sourcing .zshrc"
source ~/.zshrc
success "All done"
