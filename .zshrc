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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
