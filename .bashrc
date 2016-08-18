# start new terminal in last directory
. /etc/profile.d/vte.sh

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='\[\e[0;35m\]\u\[\e[1;30m\]@\[\e[1;37m\]\h \[\e[0;32m\]\W \[\e[1;00m\]$\[\e[0m\] '
PS1='\[\e[0;35m\]\u\[\e[1;30m\] \W \[\e[1;00m\]$\[\e[0m\] '

# do not put in history if starts with space
export HISTCONTROL=ignorespace
export EDITOR=vim

alias j='jobs'
alias f='fg'
alias l='ls --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mocp='mocp --music-dir --theme=transparent-background'

alias burp='java -jar -Xmx512m ~/opt/burpsuite_free_v1.6.01.jar &'
alias sublime='~/opt/sublime_text_3/sublime_text'
alias text2pdf='~/opt/text2pdf/./text2pdf -s11 -v15'
alias mermaid='~/opt/node_modules/mermaid/bin/mermaid.js'

# set before with 'sdcv --data-dir ~/.stardict/dic/'
alias fr='sdcv -u "Dictionnaire de l’Académie Française, 6ème édition (1835)."'
alias en='sdcv -u "WordNet"'

# interact with clipboard
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# handy
alias shred='shred -vzun 50'    # truly nuke a file
alias catwn='tail -n +1'        # cat [w]ith file[n]ames

# dev life
alias kring='killall {dring,gnome-ring}'
alias dring='SIPLOGLEVEL=0 AVLOGLEVEL=0 RING_TLS_LOGLEVEL=0 dring'

# removes git push gnome widget
unset SSH_ASKPASS

# wiki-browser-html
export wiki_browser=firefox

function sprunge()
{
    "$@" | curl -F 'sprunge=<-' http://sprunge.us
}
function swap()         
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}
now_date=$(date +%d-%m-%Y)

# env setup until better place is found
synclient TapButton1=1 # 1 finger  = left click
synclient TapButton2=3 # 2 fingers = right click
synclient TapButton3=2 # 3 fingers = middle click

systemctl start --user devilspie

# reminders
# export LD_LIBRARY_PATH="$(pwd)"
# /usr/lib/python3.5/site-packages/Cython/Includes/libcpp/

