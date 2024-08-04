setopt histignorealldups sharehistory

ZSH_DISABLE_COMPFIX=true

fpath+=~/.config/completions
fpath+=~/.asdf/completions

# export TERM="tmux-256color"
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load.

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context os_icon kubecontext custom_goversion vcs dir)
POWERLEVEL9K_CUSTOM_GOVERSION="echo -n ' '; go version | awk '{print \$3}'| sed 's/go//'"
POWERLEVEL9K_CUSTOM_GOVERSION_BACKGROUND="237"
POWERLEVEL9K_CUSTOM_GOVERSION_FOREGROUND="227"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator vi_mode history )
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_KUBECONTEXT_BACKGROUND=235
POWERLEVEL9K_KUBECONTEXT_FOREGROUND=045

POWERLEVEL9K_STATUS_ERROR_FOREGROUND=196
POWERLEVEL9K_STATUS_ERROR_BACKGROUND=0
POWERLEVEL9K_STATUS_OK_BACKGROUND=235

#POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZ=20

plugins=(colored-man-pages colorize cp docker git-prompt gitignore golang kubectl ssh-agent sudo tmux vi-mode z fzf man zsh-autosuggestions git-extras kubectx asdf)

# User configuration

# zsh syntax highlightinh
# source ${HOME}/.config/zsh/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

export PATH="${PATH}:.:${HOME}/bin:/snap/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# nix fubar
export PATH="${HOME}/.nix-profile/bin:/nix/var/nix/profiles/default/bin:${PATH}"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export PAGER=

[ -f ~/.funcs.sh ] && source ~/.funcs.sh

# terminal fix for disappearing cursor w/ tmux
set -g default-terminal "xterm-256color"
# tput cnorm

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# key bindings

bindkey -v
bindkey '^R' history-incremental-search-backward

# aliases
[[ -s "$HOME/.alias" ]] && source "$HOME/.alias"
#
#prompt
precmd() { print "" }

autoload -U colors && colors

export EDITOR=nvim

export DOCKER_GITHUB_TOKEN=8d24031296185e31b292ca69789186c7488a4b27

# scmbreeze
[ -s "${HOME}/.scm_breeze/scm_breeze.sh" ] && source "${HOME}/.scm_breeze/scm_breeze.sh"

# fzf
# source /usr/share/doc/fzf/examples/key-bindings.zsh
# source /usr/share/doc/fzf/examples/completion.zsh

# go
export GOPATH=${HOME}/work/src/other/gopath
export GOBIN=${GOPATH}/bin
export PATH="${GOBIN}:${PATH}"

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# more kube stuff

alias kubectl=kubecolor
compdef kubecolor=kubectl

[[ -f ${HOME}/.kube/load-configs.sh ]] && source ${HOME}/.kube/load-configs.sh

# rust
source "${HOME}/.asdf/installs/rust/1.79.0/env"
export PATH=${HOME}/.cargo/bin:${PATH}

# node
export PATH=${PATH}:~/.npm-global/bin

# python
export PATH=${PATH}:${HOME}/.local/bin

# nmon
export NMON=cdklmMMMnouUVv.

autoload -Uz compinit && compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(gdircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# direnv hook
eval "$(direnv hook zsh)"

# prune path
typeset -U path

export OPENAI_KEY="$(pass openai.com/frank@zerofudge.de/apikey)"

# powerline
# powerline-daemon -q
# source ${HOME}/.powerline.sh

