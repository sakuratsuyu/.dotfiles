#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/usr/local/cuda/bin:$PATH

port=7890
alias proxy='
export http_proxy="http://127.0.0.1:$port";
export https_proxy="http://127.0.0.1:$port";
export ftp_proxy="http://127.0.0.1:$port";
export all_proxy="http://127.0.0.1:$port";
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com";
'
alias unproxy='
unset http_proxy
unset https_proxy
unset ftp_proxy
unset all_proxy
unset no_proxy
'

export TRASH_BIN=~/.trash_bin
function rm {
    mv $* "${TRASH_BIN}"
}
function ct {
    if [[ $(echo $(ls -a "${TRASH_BIN}" | wc -l)-$(ls "${TRASH_BIN}" | wc -l) | bc) -gt 2 ]]; then
        /bin/rm -rf "${TRASH_BIN}"/.*
    fi
    if [[ $(echo $(ls "${TRASH_BIN}" | wc -l) | bc) -gt 0 ]]; then
        /bin/rm -rf "${TRASH_BIN}"/*
    fi
}
alias lt="ls -a ${TRASH_BIN}"

alias lg="lazygit"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gP="git push"
alias gp="git pull"
alias gco="git checkout"

export VISUAL=vim
export EDITOR=vim
export PAGER=less

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.theme.zsh ]] || source ~/.theme.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sakur/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sakur/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sakur/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sakur/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
