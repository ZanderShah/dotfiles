export ZSH=$HOME/.oh-my-zsh
source $HOME/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle virtualenv
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

alias octave='octave --no-gui'
alias venvactivate='source ./venv/bin/activate'
alias vi='mvim -v'
alias vim='mvim -v'
alias emacs='emacsclient -nw -a ""'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -r /Users/ZanderShah/.opam/opam-init/init.zsh && . /Users/ZanderShah/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
