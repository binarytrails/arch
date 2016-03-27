# start new terminal in last directory
. /etc/profile.d/vte.sh

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
PS1='\[\e[0;35m\]\u\[\e[1;30m\]@\[\e[1;37m\]\h \[\e[0;32m\]\W \[\e[1;00m\]$\[\e[0m\] '

# do not put in history if starts with space
export HISTCONTROL=ignorespace

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mocp='mocp --music-dir --theme=transparent-background'

alias burp='java -jar -Xmx512m ~/opt/burpsuite_free_v1.6.01.jar &'
alias sublime='~/opt/sublime_text_3/sublime_text'
alias text2pdf='~/opt/text2pdf/./text2pdf -s11 -v15'

# set before with 'sdcv --data-dir ~/.stardict/dic/'
alias french_dict='sdcv -u "Dictionnaire de l’Académie Française, 6ème édition (1835)."'
alias english_dict='sdcv -u "WordNet"'

# interact with clipboard
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# truly nuke a file
alias shred=' shred -vzun 50'

# removes git push gnome widget
unset SSH_ASKPASS

# wiki-browser-html
export wiki_browser=firefox

# swap filenames
function swap()         
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

now_date=$(date +%d-%m-%Y)
