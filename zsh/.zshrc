# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

alias sudo="sudo -E"
alias vim="nvim"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gP="git push"
alias gp="git pull"
alias gco="git checkout"

alias s="neofetch"
alias ra="ranger"
alias lg="lazygit"


alias proxy='
    export http_proxy="http://127.0.0.1:7890";
    export https_proxy="http://127.0.0.1:7890";
    export ftp_proxy="http://127.0.0.1:7890";
    export all_proxy="http://127.0.0.1:7890";
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com";
'

alias unproxy='
unset http_proxy
unset https_proxy
unset ftp_proxy
unset all_proxy
unset no_proxy
'

alias lt="ls -a ~/.trash_bin/"
function rm {
    mv $* ~/.trash_bin/
}
function ct {
    if [[ $(echo $(ls -la ~/.trash_bin/ | wc -l)-$(ls -l ~/.trash_bin/ | wc -l) | bc) -gt 2 ]]; then
        /bin/rm -rf ~/.trash_bin/.*
    fi
    if [[ $(echo $(ls -l ~/.trash_bin/ | wc -l) | bc) -gt 1 ]]; then
        /bin/rm -rf ~/.trash_bin/*
    fi
}

function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

export RANGER_LOAD_DEFAULT_RC=FALSE

export VISUAL=nvim
export EDITOR=nvim
export PAGER=less

# source /opt/miniconda/etc/profile.d/conda.sh

[[ ! -f ~/.theme.zsh ]] || source ~/.theme.zsh

