##     ______ _____ _    _ _____   _____
##    |___  // ____| |  | |  __ \ / ____|
##       / /| (___ | |__| | |__) | |
##      / /  \___ \|  __  |  _  /| |
##   _ / /__ ____) | |  | | | \ \| |____
##  (_)_____|_____/|_|  |_|_|  \_\\_____|
##

zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/home/nimide/.oh-my-zsh"
export GOPATH="/home/nimide/go"
export PATH=$PATH:$GOPATH/bin
export GOVCS=*:all
export CGO_LDFLAGS_ALLOW='-Wl,(-search_paths_first|-headerpad_max_install_names)'
export PATH=$PATH:/home/nimide/.local/share/gem/ruby/2.7.0/bin
export PATH=$PATH:/home/nimide/.local/bin
export PATH=$PATH:/home/nimide/anaconda3/bin
export RSTUDIO_CHROMIUM_ARGUMENTS="--disable-gpu"
export R_LIBS_USER="~/r/library"
export FZF_BASE="~/.fzf"
export FZF_DEFAULT_COMMAND='fd -H'
export DISABLE_FZF_AUTO_COMPLETION="true"
export DISABLE_FZF_KEY_BINDINGS="false"
export FZF_DEFAULT_OPTS="--info=inline --border=rounded"
export FZF_CTRL_T_OPTS="--height=30 --info=inline --border=rounded"
export FZF_CTRL_R_OPTS="--height=30 --info=inline --border=rounded"
export FZF_ALT_C_OPTS="--height=30 --info=inline --border=rounded"
export VISUAL='nvim'
export EDITOR=$VISUAL
export LIBGL_ALWAYS_INDIRECT=1
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print$2}'):0.0

source $(dirname $(gem which colorls))/tab_complete.sh

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Aliases
source $ZSH/alias.txt 
#source ~/alias.txt

# opam configuration
test -r /home/nimide/.opam/opam-init/init.zsh && . /home/nimide/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit light jeffreytse/zsh-vi-mode
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

# Load Git and Sudo plugin from OMZ
zinit snippet OMZP::git
zinit snippet OMZP::sudo

zinit light romkatv/powerlevel10k

### End of Zinit's installer chunk

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
