fpath+=~/.config/completions
fpath+=~/.asdf/completions

export TERM="tmux-256color"
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load.

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context os_icon kubecontext custom_goversion vcs dir)
POWERLEVEL9K_CUSTOM_GOVERSION="go version | awk '{print \$3}'"
POWERLEVEL9K_CUSTOM_GOVERSION_BACKGROUND="234"
POWERLEVEL9K_CUSTOM_GOVERSION_FOREGROUND="227"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator vi_mode history )
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_KUBECONTEXT_BACKGROUND=237
POWERLEVEL9K_KUBECONTEXT_FOREGROUND=045

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

plugins=(colored-man-pages colorize cp docker docker-compose git-prompt gitignore golang kubectl ssh-agent sudo tmux vi-mode z ubuntu systemd fzf man zsh-autosuggestions debian vscode git-extras kubectx asdf)

# User configuration

# zsh syntax highlightinh
# source ${HOME}/.config/zsh/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

export PATH="${PATH}:${HOME}/bin:/snap/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# nix fubar
export PATH="${HOME}/.nix-profile/bin:/nix/var/nix/profiles/default/bin:${PATH}"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export PAGER=

[ -f ~/.funcs.sh ] && source ~/.funcs.sh

# terminal fix for disappearing cursor w/ tmux
set -g default-terminal "xterm-256color"
tput cnorm

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
export JIRA_NAME=$USER

# scmbreeze
[ -s "${HOME}/.scm_breeze/scm_breeze.sh" ] && source "${HOME}/.scm_breeze/scm_breeze.sh"

# fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# go
export GOPATH=${HOME}/work/src/other/gopath
export GOBIN=${GOPATH}/bin
export PATH="${GOBIN}:${PATH}"

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# perl
export PATH="${HOME}/perl5/bin${PATH:+:${PATH}}"
PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;

# more kube stuff

alias kubectl=kubecolor
compdef kubecolor=kubectl

source ${HOME}/.kube/load-configs.sh

xmodmap ${HOME}/.Xmodmap

# rust
source "${HOME}/.asdf/installs/rust/1.76.0/env"
export PATH=${HOME}/.cargo/bin:${PATH}

# node
export PATH=${PATH}:~/.npm-global/bin

# python
export PATH=${PATH}:${HOME}/.local/bin

# garden
export PATH=${PATH}:${HOME}/.garden/bin


# nmon
export NMON=cdklmMMMnouUV.

autoload -Uz compinit && compinit

# umlautse
setxkbmap -option compose:caps

# direnv hook
eval "$(direnv hook zsh)"

# prune path
typeset -U path
