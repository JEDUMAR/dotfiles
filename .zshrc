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

# Plugins Oh My Zsh mejorados
plugins=(git sudo history colored-man-pages command-not-found extract z zsh-autosuggestions zsh-syntax-highlighting)

# Aliases adicionales optimizados
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'
alias instalar='sudo apt install'
alias actualizar='sudo apt update && sudo apt upgrade'
alias limpieza='sudo apt autoremove && sudo apt autoclean'

# Función para navegación rápida
mkcd() { mkdir -p "$1" && cd "$1"; }

# Función para estado del sistema mejorada
status() {
    echo "🖥️  Sistema: $(lsb_release -d | cut -f2)"
    echo "👤 Usuario: $USER"
    echo "🐚 Shell: $SHELL"
    echo "💾 Memoria: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
    echo "💽 Disco: $(df -h / | tail -1 | awk '{print $3 "/" $2 " (" $5 " usado)"}')"
    if command -v sensors >/dev/null 2>&1; then
        temp=$(sensors 2>/dev/null | grep "Package id 0" | awk '{print $4}' | head -1)
        if [ ! -z "$temp" ]; then
            echo "🌡️  CPU: $temp"
        fi
    fi
}

echo "⚡ Configuración optimizada cargada"

# Función mejorada para monitoreo del sistema
status() {
    echo "🖥️  Sistema: $(lsb_release -d | cut -f2)"
    echo "👤 Usuario: $USER" 
    echo "🐚 Shell: $SHELL"
    echo "💾 Memoria: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
    echo "💽 Disco: $(df -h / | tail -1 | awk '{print $3 "/" $2 " (" $5 " usado)"}')"
    if command -v sensors >/dev/null 2>&1; then
        temp=$(sensors 2>/dev/null | grep "Package id 0" | awk '{print $4}' | head -1)
        [ ! -z "$temp" ] && echo "🌡️  CPU: $temp"
    fi
    echo "⚡ Carga: $(uptime | awk -F'load average:' '{print $2}')"
}

# Activar plugins si no están activos
plugins=(git sudo history colored-man-pages command-not-found extract z zsh-autosuggestions zsh-syntax-highlighting)
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# === ALIASES PROFESIONALES PARA ABOGADO TECH ===
alias ll='exa -la --icons --git'
alias lt='exa --tree --level=3 --icons'
alias cat='bat --style=header,grid'
alias find='fd'
alias du='duf'
alias top='btop'
alias grep='rg'
alias vpn-status='protonvpn status && echo "--- Flatpak ---" && flatpak run com.protonvpn.www --help'
alias vpn-connect='protonvpn connect --fastest'
alias vpn-disconnect='protonvpn disconnect'
alias sys-info='fastfetch'
alias update-all='sudo apt update && sudo apt upgrade -y && flatpak update -y'

# === FUNCIONES AVANZADAS ===
# Función para análisis de sistema
syscheck() {
    echo "=== ANÁLISIS COMPLETO DEL SISTEMA ==="
    fastfetch
    echo "\n=== ESTADO VPN ==="
    protonvpn status 2>/dev/null || echo "CLI no disponible"
    echo "\n=== PROCESOS VPN ==="
    ps aux | grep -i proton | grep -v grep
    echo "\n=== ESPACIO EN DISCO ==="
    duf
}

# Función para limpieza rápida
cleanup() {
    echo "🧹 Limpiando sistema..."
    sudo apt autoremove -y
    sudo apt autoclean
    flatpak uninstall --unused -y
    echo "✅ Sistema limpio"
}
alias vpn-connect='sudo protonvpn connect --fastest && log_vpn_session'
alias vpn-disconnect='sudo protonvpn disconnect && log_vpn_session'
legal_vpn_setup() { ... }
source ~/legal_tech_workspace/vpn_logger.sh
alias bat='batcat'

# === ALIASES PROTONVPN FLATPAK (FUNCIONAL) ===
alias vpn='flatpak run com.protonvpn.www'
alias vpn-start='flatpak run com.protonvpn.www &'
alias vpn-status='curl -s https://ipinfo.io | jq "." || curl -s https://ipinfo.io'
alias vpn-ip='curl -s https://ipinfo.io/ip'
alias vpn-location='curl -s https://ipinfo.io/city && echo " - " && curl -s https://ipinfo.io/country'

# === FUNCIONES LEGALES ESPECIALIZADAS ===
legal_vpn_check() {
    echo "🏛️ VERIFICACIÓN LEGAL VPN"
    echo "📍 IP actual: $(curl -s https://ipinfo.io/ip)"
    echo "🌍 Ubicación: $(curl -s https://ipinfo.io/city), $(curl -s https://ipinfo.io/country)"
    echo "🔒 Proveedor: $(curl -s https://ipinfo.io/org)"
    echo "⏰ Timestamp: $(date)"
}

legal_investigation_mode() {
    echo "🏛️ MODO INVESTIGACIÓN LEGAL ACTIVADO"
    
    # Verificar VPN activa
    if curl -s --connect-timeout 3 https://ipinfo.io/org | grep -i proton >/dev/null; then
        echo "✅ VPN ProtonVPN ACTIVA"
    else
        echo "⚠️ VPN no detectada como ProtonVPN"
        echo "🚀 Iniciando ProtonVPN..."
        flatpak run com.protonvpn.www &
        sleep 5
    fi
    
    # Log de sesión legal
    mkdir -p ~/legal_tech_logs/investigations
    echo "$(date): Investigación iniciada - IP: $(curl -s https://ipinfo.io/ip)" >> ~/legal_tech_logs/investigations/session_$(date +%Y%m%d).log
    
    # Abrir Firefox en modo privado
    firefox --private-window &
    
    echo "✅ MODO INVESTIGACIÓN LEGAL ACTIVADO"
}

source ~/legal_tech_workspace/legal_tools.sh

# === ALIASES ESPECIALIZADOS ABOGADO LEGALTECH ===
alias case-new='new_case'
alias evidence-backup='secure_evidence_backup'
alias ip-forensic='forensic_ip_check'
alias legal-workspace='cd ~/legal_tech_workspace && ls -la'
alias case-list='ls -la ~/legal_tech_workspace/cases/'
alias vpn-log='tail -f ~/legal_tech_logs/vpn_sessions/session_$(date +%Y%m%d).log'

alias system-check='~/legal_tech_workspace/system_check.sh'
alias system-check='~/legal_tech_workspace/system_check.sh'

# === LEGAL TECH SYSTEM - CLEAN VERSION ===
alias system-check='~/legal_tech_workspace/system_check.sh'
alias legal-workspace='cd ~/legal_tech_workspace && ls -la'
alias case-list='ls -la ~/legal_tech_workspace/cases/ 2>/dev/null || echo "No cases found"'
alias load-legal-tools='source ~/legal_tech_workspace/legal_tools.sh'

source $HOME/.legaltech_prompt.zsh

# LegalTech Performance Monitor

# LegalTech Aliases - Configuración Corregida
alias legalperf='bash ~/legaltech_tools/performance_monitor.sh'
