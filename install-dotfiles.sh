#!/bin/bash
# =============================================================================
# SCRIPT DE RECUPERACIÓN AUTOMÁTICA DE DOTFILES
# Para usar en cualquier sistema Linux nuevo
# =============================================================================

echo "🚀 INSTALACIÓN AUTOMÁTICA DE DOTFILES - JEDUMAR"
echo "==============================================="

# Detectar el sistema
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    echo "Sistema detectado: $OS"
fi

# Instalar dependencias según el sistema
echo "📦 Instalando dependencias..."
if command -v apt &> /dev/null; then
    # Ubuntu/Debian/Pop!_OS
    sudo apt update
    sudo apt install -y zsh git curl exa bat fd-find
elif command -v dnf &> /dev/null; then
    # Fedora
    sudo dnf install -y zsh git curl exa bat fd-find
elif command -v pacman &> /dev/null; then
    # Arch Linux
    sudo pacman -S zsh git curl exa bat fd
fi

# Instalar Oh My Zsh
echo "🎨 Instalando Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Instalar Starship
echo "⭐ Instalando Starship..."
if ! command -v starship &> /dev/null; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Instalar plugins de Zsh
echo "📦 Instalando plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting

# Configurar dotfiles
echo "⚙️ Configurando dotfiles..."
git clone --bare https://github.com/JEDUMAR/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo "alias config='/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME'" >> ~/.bashrc
config config --local status.showUntrackedFiles no
config checkout

# Cambiar shell a Zsh
echo "🐚 Configurando Zsh como shell predeterminado..."
chsh -s $(which zsh)

echo "✅ INSTALACIÓN COMPLETA"
echo "Reinicia tu sesión para aplicar todos los cambios"
