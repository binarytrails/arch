export ZSH="/home/n0t/.oh-my-zsh"

ZSH_THEME="lambda"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

function meteo () { [[ $1 ]] && curl wttr.in/$1 || curl wttr.in/Montréal; }
