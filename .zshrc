export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git sudo history)
source $ZSH/oh-my-zsh.sh

if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

alias ll='ls -alF'
alias gs='git status'
alias actualizar='sudo apt update && sudo apt upgrade'

info-sistema() {
    echo "Sistema: $(lsb_release -d | cut -f2)"
    echo "Usuario: $USER"
    echo "Shell: $SHELL"
}

if [[ $- == *i* ]]; then
    echo "🚀 Terminal optimizada lista!"
fi

# Instalar plugins automáticamente
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" &>/dev/null &
fi

# Syntax highlighting  
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" &>/dev/null &
fi

# Actualizar plugins
plugins=(git sudo history colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

# Más aliases útiles
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias ga='git add'
alias gc='git commit -m'
alias instalar='sudo apt install'

echo "🔥 Configuración Oh My Zsh cargada"
