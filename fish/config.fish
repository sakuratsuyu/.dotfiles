if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set -g -x fish_greeting "Welcome to fish, the friendly interactive shell. Type help for instructions on how to use fish"
set -g -x fish_greeting

set -g -x fish_autosuggestion_enabled 1

set -g -x RANGER_LOAD_DEFAULT_RC FALSE
set -g -x VISUAL nvim

set -g -x EDITOR nvim
set -g -x PAGER less

set -g -x PATH /home/sakur/.local/bin $PATH

set -g -x PATH /usr/lib/jvm/java-20-jdk/bin $PATH

set -g -x PATH /home/sakur/.gem/ruby/3.0.0/bin $PATH

# proxy

bind -M default \ce accept-autosuggestion
bind -M insert \ce accept-autosuggestion

bind -M default \cp history-search-backward
bind -M insert \cp history-search-backward

bind -M default \cn history-search-forward
bind -M insert \cn history-search-forward

fish_vi_key_bindings

abbr -a -- gs 'git status'
abbr -a -- ga 'git add'
abbr -a -- gc 'git commit'
abbr -a -- gl 'git log --all --graph --decorate'
abbr -a -- gp 'git pull'
abbr -a -- gP 'git push'
abbr -a -- gco 'git checkout'
abbr -a -- sctl 'systemctl'
abbr -a -- sctlp 'systemctl status'
abbr -a -- sctls 'systemctl stop'
abbr -a -- sctlr 'systemctl restart'
