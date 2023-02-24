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

fish_vi_key_bindings
