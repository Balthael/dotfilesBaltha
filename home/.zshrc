#  ╔═╗╔═╗╦ ╦╦═╗╔═╗  ╔═╗╔═╗╔╗╔╔═╗╦╔═╗	- z0mbi3
#  ╔═╝╚═╗╠═╣╠╦╝║    ║  ║ ║║║║╠╣ ║║ ╦	- https://github.com/gh0stzk/dotfiles
#  ╚═╝╚═╝╩ ╩╩╚═╚═╝  ╚═╝╚═╝╝╚╝╚  ╩╚═╝	- My zsh confBaltha

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#  ┬  ┬┌─┐┬─┐┌─┐
#  └┐┌┘├─┤├┬┘└─┐
#   └┘ ┴ ┴┴└─└─┘
export VISUAL="${EDITOR}"
export EDITOR='geany'
export BROWSER='firefox'
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export SUDO_PROMPT="Deploying root access for %u. Password pls: "
export BAT_THEME="base16"

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#spotify
function spoti(){
    /sbin/spotify &>/dev/null & disown
}

#Borrado Seguro
function rmk(){
    for file in "$@"
    do
        scrub -p dod "$file"
        shred -zun 10 -v "$file"
    done
}


#Ir a HTB
function htb(){
  cd /home/balthael/Documents/HTB/Machines/
}

#Python Environment
pv () {
    if [ -d "env" ]
    then
        print "venv exists, entering.."
        source env/bin/activate
    else
        print "venv does not exist, creating pyenv..."
        python3 -m venv env
        source env/bin/activate
    fi
}

#buscador de paquetes
psearch () {
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    NC='\033[0m'
    if [ -z "$1" ]
    then
        echo -e "${RED}Usage: psearch <package_name>${NC}"
        return 1
    fi
    sudo -v
    echo -e "\n${YELLOW}[Searching in PACMAN]:${NC}\n"
    sudo pacman -Ss "$1"
    echo -e "\n${GREEN}========================================${NC}\n"
    echo -e "\n${YELLOW}[Searching in PARU]:${NC}\n"
    paru -Ss "$1"
    echo -e "\n"
}
#Nessus
function nessus(){
    sudo systemctl start nessusd.service
}


#=========== METADATA-REMOVE-====

function metaoff() {

    if [ -z "$1" ]; then
        echo "Empty, input a file"
        return 1
    fi

    exiftool -all= "$1"
}


#============================  SYSTEM INFO ================

function info() {
    printf "CPU: "
    cat /proc/cpuinfo | grep "model name" | head -1 | awk '{ for (i = 4; i <= NF; i++) printf "%s ", $i }'
    printf "\n"

    cat /etc/issue | awk '{ printf "OS: %s %s %s %s | " , $1 , $2 , $3 , $4 }'
    uname -a | awk '{ printf "Kernel: %s " , $3 }'
    uname -m | awk '{ printf "%s | " , $1 }'
    printf "\n"
    uptime | awk '{ printf "Uptime: %s %s %s", $3, $4, $5 }' | sed 's/,//g'
    printf "\n"
    #cputemp | head -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
    #cputemp | tail -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
    #cputemp | awk '{ printf "%s %s", $1 $2 }'
}

#VPN HTB Academia
function avpn(){
    sudo openvpn $HOME/Documents/HTB/vpn/academy-regular.ovpn
}


#VPN HTB Machines
function mvpn(){
    sudo openvpn $HOME/Documents/HTB/vpn/lab_Balthael.ovpn
}

#Matar procesos rapido
function kp(){

if [ -z "$1" ]
then
    echo "Uso: kp <process name>"
    exit 1
fi

killall -9 $1
}

#stacer
function stacer(){
    /sbin/stacerr &>/dev/null & disown
}

function steam(){
    /sbin/steamm &>/dev/null & disown
}

#Configurar monitoores tasa de refresco
function monitor(){
    sudo nvidia-settings --assign CurrentMetaMode="DP-2: 1920x1080_165 +0+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}, HDMI-0: 1920x1080_165 +1920+0 {ForceCompositionPipeline=On, ForceFullCompositionPipeline=On}"
}
function kali(){
    sudo mount -t cifs //PCBALTHA/Kali /mnt/kali -o username=balthael
                                                 
}

function telegram(){
    $HOME/Downloads/Telegram/Telegram &>/dev/null & disown
}


function kpmg(){
    cd  /mnt/kali/KPMG/
}


function discordd(){
    /sbin/discord &> /dev/null & disown
}
function virt(){
    /usr/bin/virtualbox &> /dev/null & disown
}

function settarget(){
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > $HOME/.config/bin/target
}

function burp(){
  "/home/balthael/tools/burpsuitepro/burpsuite_pro_v2025.1.4/jdk-22.0.2/bin/java" "--add-opens=java.desktop/javax.swing=ALL-UNNAMED" "--add-opens=java.base/java.lang=ALL-UNNAMED" "--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED" "--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED" "--add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED" "-javaagent:/home/balthael/tools/burpsuitepro/burpsuite_pro_v2025.1.4/burploader.jar" "-noverify" "-jar" "/home/balthael/tools/burpsuitepro/burpsuite_pro_v2025.1.4/burpsuite_pro_v2025.1.4.jar" &>/dev/null & disown
}

#function john(){
#  $HOME/tools/passwords/john-jumbo/run/john
#  
#}

function keepass(){
  /usr/bin/keepassxc &>/dev/null & disown
  
}

function obsi(){
  /usr/bin/obsidian &>/dev/null & disown
  
}

#poweroff
function pp(){
	poweroff
}

function cleartarget(){
	echo '' > $HOME/.config/bin/target
}

function mkt(){
  mkdir {nmap,content,exploits}
  echo -e "[+] Se han creado las carpetas nmap,content y exploits"
   
}

# Extract nmap information
function extractPorts(){
    ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
    echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
    echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
    echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
    echo $ports | tr -d '\n' | xclip -sel clip
    echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
    cat extractPorts.tmp; rm extractPorts.tmp
}

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


# Tools Path
TOOLS_PATH=(
    "$HOME/tools/bin"
    "$HOME/tools/web/karma"
    "$HOME/tools/web/amass/"
    "$HOME/tools/web/shcheck/shcheck"
    "$HOME/tools/web/securityheaders"
    "$HOME/tools/web/favicon-hashtrick"
    "$HOME/tools/windows/AD/kerbrute"
    "$HOME/tools/windows/AD"
    "$HOME/tools/windows/AD/bloodyAD"
    "$HOME/tools/windows/AD/pywhisker/pywhisker"
    "$HOME/tools/windows/AD/BloodHound"
    "$HOME/tools/windows/AD/BloodHound.py"
    "$HOME/tools/windows/AD/evil-winrm/bin"
    "$HOME/tools/windows/AD/powerview"
    "$HOME/tools/custom-scripts"
    "$HOME/tools/windows/winrmexec"
    "$HOME/.npm-global/bin"
    "/var/lib/flatpak/exports/bin"
    "$HOME/.local/share/flatpak/exports/bin"
    #"$HOME/tools/passwords/john-jumbo/run"
  
   )

# System or Framework Paths
SYSTEM_PATHS=(
    "$HOME/.local/bin"
    "$HOME/.pyenv/bin"
    "$HOME/go/bin"
    "$HOME/go/bin"
    "/root/go/bin"
    "/opt/nvim/nvim-linux64/bin"
    "/usr/local/sbin"
    "/usr/local/bin"
    "/usr/sbin"
    "/usr/bin"
    "/sbin"
    "/bin"
    "/usr/local/games"
    "/usr/games"
    "$HOME/.fzf/bin"
    "/usr/share/doc/python3-impacket/examples"
    "$HOME/.local/bin"
    "/root/.local/bin"
)

# Agrego todas las rutas verificando que existan
for dir in "${TOOLS_PATH[@]}" "${SYSTEM_PATHS[@]}"; do
    [[ -d "$dir" && ":$PATH:" != *":$dir:"* ]] && export PATH="$dir:$PATH"
done

# Limpo variables temporales
unset TOOLS_PATH SYSTEM_PATHS



#  ┬  ┌─┐┌─┐┌┬┐  ┌─┐┌┐┌┌─┐┬┌┐┌┌─┐
#  │  │ │├─┤ ││  ├┤ ││││ ┬││││├┤
#  ┴─┘└─┘┴ ┴─┴┘  └─┘┘└┘└─┘┴┘└┘└─┘
autoload -Uz compinit

local zcompdump="$HOME/.config/zsh/zcompdump"

if [[ -n "$zcompdump"(#qN.mh+24) ]]; then
    compinit -i -d "$zcompdump"
else
    compinit -C -d "$zcompdump"
fi

if [[ ! -f "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc" ]]; then
    zcompile -U "$zcompdump"
fi


autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)

zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list \
		'm:{a-zA-Z}={A-Za-z}' \
		'+r:|[._-]=* r:|=*' \
		'+l:|=*'
zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'
zstyle ':fzf-tab:*' fzf-flags --style=full --height=90% --pointer '>' \
                --color 'pointer:green:bold,bg+:-1:,fg+:green:bold,info:blue:bold,marker:yellow:bold,hl:gray:bold,hl+:yellow:bold' \
                --input-label ' Search ' --color 'input-border:blue,input-label:blue:bold' \
                --list-label ' Results ' --color 'list-border:green,list-label:green:bold' \
                --preview-label ' Preview ' --color 'preview-border:magenta,preview-label:magenta:bold'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons=always --color=always -a $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --icons=always --color=always -a $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always --theme=base16 $realpath'
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter

#  ┬ ┬┌─┐┬┌┬┐┬┌┐┌┌─┐  ┌┬┐┌─┐┌┬┐┌─┐
#  │││├─┤│ │ │││││ ┬   │││ │ │ └─┐
#  └┴┘┴ ┴┴ ┴ ┴┘└┘└─┘  ─┴┘└─┘ ┴ └─┘
expand-or-complete-with-dots() {
  echo -n "\e[31m…\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

#  ┬ ┬┬┌─┐┌┬┐┌─┐┬─┐┬ ┬
#  ├─┤│└─┐ │ │ │├┬┘└┬┘
#  ┴ ┴┴└─┘ ┴ └─┘┴└─ ┴
HISTFILE=~/.config/zsh/zhistory
HISTSIZE=50000
SAVEHIST=50000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#  ┌─┐┌─┐┬ ┬  ┌─┐┌─┐┌─┐┬    ┌─┐┌─┐┌┬┐┬┌─┐┌┐┌┌─┐
#  ┌─┘└─┐├─┤  │  │ ││ ││    │ │├─┘ │ ││ ││││└─┐
#  └─┘└─┘┴ ┴  └─┘└─┘└─┘┴─┘  └─┘┴   ┴ ┴└─┘┘└┘└─┘
setopt AUTOCD              # change directory just by typing its name
setopt PROMPT_SUBST        # enable command substitution in prompt
setopt MENU_COMPLETE       # Automatically highlight first element of completion menu
setopt LIST_PACKED		   # The completion menu takes less space.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.

#  ┌┬┐┬ ┬┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┌┬┐
#   │ ├─┤├┤   ├─┘├┬┘│ ││││├─┘ │
#   ┴ ┴ ┴└─┘  ┴  ┴└─└─┘┴ ┴┴   ┴
function dir_icon {
  if [[ "$PWD" == "$HOME" ]]; then
    echo "%B%F{cyan}%f%b"
  else
    echo "%B%F{cyan}%f%b"
  fi
}

PS1='%B%F{blue}%f%b  %B%F{magenta}%n%f%b $(dir_icon)  %B%F{red}%~%f%b${vcs_info_msg_0_} %(?.%B%F{green}.%F{red})%f%b '

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi
source $HOME/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#  ┌─┐┬  ┬ ┬┌─┐┬┌┐┌┌─┐
#  ├─┘│  │ ││ ┬││││└─┐
#  ┴  ┴─┘└─┘└─┘┴┘└┘└─┘
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-sudo-plugin/sudo.plugin.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[3~' delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

#  ┌─┐┬ ┬┌─┐┌┐┌┌─┐┌─┐  ┌┬┐┌─┐┬─┐┌┬┐┬┌┐┌┌─┐┬  ┌─┐  ┌┬┐┬┌┬┐┬  ┌─┐
#  │  ├─┤├─┤││││ ┬├┤    │ ├┤ ├┬┘│││││││├─┤│  └─┐   │ │ │ │  ├┤
#  └─┘┴ ┴┴ ┴┘└┘└─┘└─┘   ┴ └─┘┴└─┴ ┴┴┘└┘┴ ┴┴─┘└─┘   ┴ ┴ ┴ ┴─┘└─┘
function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (kitty*|alacritty*|tmux*|screen*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

#  ┌─┐┬  ┬┌─┐┌─┐
#  ├─┤│  │├─┤└─┐
#  ┴ ┴┴─┘┴┴ ┴└─┘
alias mirrors="sudo reflector --verbose --latest 5 --country 'United States' --age 6 --sort rate --save /etc/pacman.d/mirrorlist"
alias update="paru -Syu --nocombinedupgrade"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias music="ncmpcpp"

alias cat="bat --theme=base16"
alias ls='eza --icons=always --color=always -a'
alias ll='eza --icons=always --color=always -la'
alias delpack='sudo pacman -Rcns'
alias v='nvim'

#  ┌─┐┬ ┬┌┬┐┌─┐  ┌─┐┌┬┐┌─┐┬─┐┌┬┐
#  ├─┤│ │ │ │ │  └─┐ │ ├─┤├┬┘ │
#  ┴ ┴└─┘ ┴ └─┘  └─┘ ┴ ┴ ┴┴└─ ┴
#$HOME/.local/bin/colorscript -r
#disable-fzf-tab
#
# Created by `pipx` on 2024-12-16 02:54:59
export PATH="$PATH:/root/.local/bin"

#========================================= WAN
function wanon(){
   curl -s ifconfig.me > "$HOME/.config/bin/wan"
}

function wanoff(){
    echo "" > "$HOME/.config/bin/wan"
}

#========================================= GET-LAN-IP
function lanon(){

    # Detect interface
    ip -4 addr show scope global | grep inet | awk '{print $2}' | cut -d'/' -f1 > "$HOME/.config/bin/lan"
}

function lanoff(){
    echo "" > "$HOME/.config/bin/lan"
}
#========================================= GET-VPN-IP
function von(){
    ip -o -4 addr list tun0 | awk '{print $4}' | cut -d/ -f1 > "$HOME/.config/bin/vpn"
}

function voff(){
    echo "" > "$HOME/.config/bin/vpn"
}
#========================================= SET & UNSET TARGET
function target(){
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > "$HOME/.config/bin/target"
}

function targetoff(){
   echo "" > "$HOME/.config/bin/target"
}
#=========================================
function domon(){
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > "$HOME/.config/bin/domain"
}

function domoff(){
   echo "" > "$HOME/.config/bin/domain"
}

