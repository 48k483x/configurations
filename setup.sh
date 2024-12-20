#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Print banner
echo -e "${BLUE}${BOLD}"
echo "╔═══════════════════════════════════════════════╗"
echo "║           Development Environment Setup        ║"
echo "║         Vim, Tmux, and Zsh Configuration      ║"
echo "╚═══════════════════════════════════════════════╝"
echo -e "${NC}"

# Function to print status messages
print_status() {
    echo -e "${BLUE}[*]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✔]${NC} $1"
}

print_error() {
    echo -e "${RED}[✘]${NC} $1"
}

# Backup existing configuration files
backup_configs() {
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local backup_dir="$HOME/.config_backup_$timestamp"
    
    print_status "Creating backup of existing configurations..."
    mkdir -p "$backup_dir"
    
    for file in ".vimrc" ".zshrc" ".tmux.conf"; do
        if [ -f "$HOME/$file" ]; then
            cp "$HOME/$file" "$backup_dir/"
            print_success "Backed up $file to $backup_dir"
        fi
    done
}

# Install vim-plug
install_vim_plug() {
    print_status "Installing vim-plug..."
    if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
        curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        print_success "vim-plug installed successfully"
    else
        print_success "vim-plug already installed"
    fi
}

# Install TPM (Tmux Plugin Manager)
install_tpm() {
    print_status "Installing TPM..."
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
        print_success "TPM installed successfully"
    else
        print_success "TPM already installed"
    fi
}

# Install Zsh plugins
install_zsh_plugins() {
    print_status "Installing Zsh plugins..."
    
    # Create ZSH_CUSTOM directory if it doesn't exist
    ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
    mkdir -p "$ZSH_CUSTOM/plugins"
    
    # Install zsh-syntax-highlighting
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
        print_success "zsh-syntax-highlighting installed"
    fi
    
    # Install zsh-autosuggestions
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
        print_success "zsh-autosuggestions installed"
    fi
}

# Copy configuration files
copy_config_files() {
    print_status "Copying configuration files..."
    
    # Replace with your actual config file paths
    cp .vimrc "$HOME/.vimrc"
    cp .zshrc "$HOME/.zshrc"
    cp .tmux.conf "$HOME/.tmux.conf"
    
    print_success "Configuration files copied"
}

# Source configuration files
source_configs() {
    print_status "Sourcing configuration files..."
    
    if [ -f "$HOME/.zshrc" ]; then
        source "$HOME/.zshrc"
    fi
    
    tmux source-file "$HOME/.tmux.conf" 2>/dev/null || true
}

# Main installation process
main() {
    backup_configs
    install_vim_plug
    install_tpm
    install_zsh_plugins
    copy_config_files
    source_configs
    
    echo -e "\n${GREEN}${BOLD}Installation completed!${NC}"
    echo -e "${BLUE}${BOLD}Important:${NC} Please run ${GREEN}:PlugInstall${NC} in Vim to install plugins"
    echo -e "Then restart your terminal for all changes to take effect"
}

# Run the installation
main
