export EDITOR=vim
export ZSH=/home/n0t/.oh-my-zsh
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:~/.local/bin:~/go/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

ZSH_THEME="lambda"

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

function meteo () { [[ $1 ]] && curl wttr.in/$1 || curl wttr.in/Montréal; }
