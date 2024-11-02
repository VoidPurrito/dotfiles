# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt autocd extendedglob nomatch interactive_comments hist_ignore_all_dups inc_append_history share_history
unsetopt beep notify
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

export OLD_WORDCHARS="*?_-.[]~=/&;!#$%^(){}<>"
WORDCHARS="*?_~&!#$%^"

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/nikhilkowshik/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export STARSHIP_CONFIG=~/.config/zsh/starship.toml
eval "$(starship init zsh)"

function hgrep() {
    local flags
    local q

    if [[ $1 == "-h" ]] || [[ $1 == "--help" ]]; then
        echo "Search for a pattern in the zah history"
        echo
        echo "usage: hgrep [SEARCH_TERM]"
        return 0
    fi

    if [[ $1 = "-i" ]]; then
        flags="-i"
        q=$2
    else
        q=$1
    fi

    if [[ -z $1 ]]; then
        history
    else
        history | grep $flags -- "$q"
    fi

}

function git-create-branch() {
    if [[ -z $1 ]]; then
        echo "error: no branch name specified"
        echo "usage: git-create-branch BRANCH_NAME"
    fi

    git checkout -b "$1"
    git push --set-upstream origin "$1"
}

function git-create-tag() {
    if [[ -z $1 ]]; then
        echo "usage: create-tag TAG_NAME"
        return 1
    fi

    git tag -a "$1" -m "$1"
    git push origin "$1"
}

function git-delete-tag() {
    if [[ -z $1 ]]; then
        echo "usage: delete-tag TAG_NAME"
    fi

    git tag -d "$1"
    git push --delete origin "$1"
}

#
# Aliases
#

alias ll="ls -Gal --color=auto"
alias history="history 0"
alias vi="nvim"

# 
# Env varibles
#

export PUBLIC_IP_ADDRESS=$(curl --silent https://checkip.amazonaws.com)

