# @author Vsevolod Ivanov

# start new terminal in last directory
#. /etc/profile.d/vte.sh

# if not running interactively, don't do anything
#[[ $- != *i* ]] && return

#PS1='\[\e[0;35m\]\u\[\e[1;30m\]@\[\e[1;37m\]\h \[\e[0;32m\]\W \[\e[1;00m\]$\[\e[0m\] '
PS1='\[\e[2;49;37m\]\u\[\e[2;49;39m\] \W \[\e[1;00m\]$\[\e[0m\] '

# do not put in history if starts with space
export HISTCONTROL=ignorespace
export EDITOR=vim
export PATH="/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:~/.local/bin:~/go/bin:/home/n0t/.gem/ruby/2.6.0/bin"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"

# android
export JAVA_HOME=/usr/lib/jvm/default
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK=/opt/android-sdk
export ANDROID_NDK_ROOT=/opt/android-ndk
export ANDROID_NDK=/opt/android-ndk
export PATH=$PATH:$PATH:$ANDROID_HOME/tools:$ANDROID_NDK:$ANDROID_NDK:$JAVA_HOME/bin

alias j='jobs'
alias f='fg'
alias l='ls --color=auto'
alias tj='journalctl -xr -S today -U tomorrow'      # today journal

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mocp='mocp --music-dir --theme=transparent-background'
alias pandoc='pandoc --variable urlcolor=cyan'
alias markdown='python -m rich.markdown'

# network-manager (see: *nmcli* for more)
alias qnm='systemctl status NetworkManager'
alias jnm='journalctl -rxt NetworkManager'
alias rnm='sudo systemctl restart NetworkManager'
alias cnm='sudo vim /etc/NetworkManager/NetworkManager.conf'

# various opt
alias burp='java -jar -Xmx512m /usr/share/burpsuite/burpsuite.jar &'
alias sublime='~/opt/sublime_text_3/sublime_text'
alias mermaid='~/opt/node_modules/mermaid/bin/mermaid.js'
alias text2pdf='~/opt/text2pdf/./text2pdf -s11 -v15'
alias topdf='unoconv -f pdf'
alias ofx-project='/usr/bin/projectGenerator -o"/opt/openFrameworks/" '
alias ipwhois='python /usr/bin/ipwhois_cli.py --hr --show_name --colorize --depth 1 --addr'

# language
alias fr='sdcv -u "Dictionnaire de l’Académie Française, 6ème édition (1835)."'
alias en='sdcv -u "WordNet"'
# note: set before with 'sdcv --data-dir ~/.stardict/dic/'

# clipboard interactions
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# handy
alias gtfo='sudo shutdown now'
alias shred='shred -vzun 50'    # truly nuke a file
alias catwn='tail -n +1'        # cat [w]ith file[n]ames
alias php2html='wget --convert-links --mirror --adjust-extension'
# --mirror --convert-links --adjust-extension --page-requisites --no-parent
alias wget-mirror='wget -mkEpnp'
alias curl-json='curl -H "Content-Type: application/json"'
alias gtm_date='TZ=GTM date'
alias cloneos="rsync -aAXv --update --delete --exclude '~/.config/cloneos_excludes.list' / " # ./folder
alias rsync-backup="rsync -aAXv --update --delete"

# dev life
alias kill-jami='killall {dring,gnome-ring,jami,jami-gnome,jami-daemon}'
alias jami-gnome='/usr/local/bin/jami-gnome'
alias jami-daemon='SIPLOGLEVEL=0 AVLOGLEVEL=0 RING_TLS_LOGLEVEL=0 /usr/lib/ring/dring -d -c'
## nm libsmth.a | demangle
alias demangle="curl --data-urlencode input@- https://demangler.com/raw"
alias memcheck="valgrind --leak-check=full --read-var-info=yes -v "
alias gerrit-push-master="git push origin HEAD:refs/for/master"
alias vbox='/usr/lib/virtualbox/VirtualBoxVM --startvm'
alias vim-shred-history=' shred -vzun 50 ~/.viminfo'

# devilspie
alias devilspie-restart='systemctl restart devilspie --user'
alias devilspie-opaque="sed -i -e 's/85/100/g' ~/.devilspie/gnome-terminal.ds && devilspie-restart"
alias devilspie-transparent="sed -i -e 's/100/85/g' ~/.devilspie/gnome-terminal.ds && devilspie-restart"

# secops
function cve-search-circl () { curl "https://cve.circl.lu/api/cve/$1"; }
function cve-search-arch () { elinks "https://security.archlinux.org/$1"; }
function grep-nmap-vuln-exploit () { cat /usr/share/nmap/scripts/script.db | grep '"vuln"\|"exploit"'; }

# human life
alias emojis="cat ~/notes/misc/emojis.md | grep :"
alias soupson="curl -v --silent http://www.soupson.ca/ 2>&1 | grep -m3 -A $(($(date +%u) + 2)) \"entry-content\" | tail -n1 | sed 's/.*: //' | sed 's/<\/p>//g'"
# $1 = place or any pattern of grep, $2 = n days ago, if none than yesterday
function c19 () { curl https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/$(date --date=$2\ days\ ago +%x | sed "s/\//-/g").csv 2>&1 | grep -i $1; }
function c19qc () { curl https://www.msss.gouv.qc.ca/professionnels/maladies-infectieuses/coronavirus-2019-ncov/ --silent | grep "<li>[^<].*cas" | sed -e 's/<[^>]*>//g' | sed 's/^[ \t]*//;s/[ \t]*$//'; }
function meteo () { [[ $1 ]] && curl wttr.in/$1 || curl wttr.in/Montréal; }

# removes git push gnome widget
unset SSH_ASKPASS

# wiki-browser-html
export wiki_browser=epiphany

# welcome ascii drawing with text
RANDOM=$$$(date +%s)
COWS=($(basename --suffix=.cow $(ls -1 /usr/share/cows)))
COW=$(echo ${COWS[RANDOM % ${#COWS[@]}]})
cowsay -f $COW $(fortune); echo
# ascii: part 2
alias bonsai='/usr/bin/cbonsai --seed $RANDOM -p -m "$(fortune)" -M 2 -l -t 0.006'

# paste it
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

function image2usb()
{
    # $1 = image; $2 = sdx
    sudo dd bs=4M if=$1 of=$2 status=progress && sync
}

function mov2mp4()
{
    # $1 = input; $2 = output
    ffmpeg -i $1 -f mp4 -vcodec copy -acodec copy $2
}

function frames2mp4()
{
    # $1 = input folder with frames
    # $2 = output xxxx.mp4
    # $3 = start frame number (e.g. 0100)
    ffmpeg -r 24 -f image2 -s 1920x1080 \
        -start_number $3 -i $1/%04d.png \
        -vcodec libx264 -crf 25 -pix_fmt yuv420p $2.mp4
}

function rmfexts()
{
    # $1 = extension; $@ (rest) = files
    local suffix=$1;
    shift;
    for f in $($@); do
        echo $(basename --suffix $suffix $f)
        mv $f $(basename --suffix $suffix $f);
    done
}

function pacman-reset-trust()
{
    rm -R /etc/pacman.d/gnupg
    pacman-key --init
    pacman-key --populate archlinux
}

function wget-aur-snapshot
{
    wget https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz
}

function rsed
{
    echo "replacing recursively $2 by $3 from $1";
    find $1 -type f -name "*" -print0 | xargs -0 sed -i '' -e "s/$2/$3/g"
}

function git-lines-count
{
    # $1 = regex i.e. *.cpp *h
    git ls-files $@ | xargs wc -l
}

function page-urls-to-pdfs
{
    # $1 = <output folder>; $2 = "<url>"; $3 = "<grep url pattern>"
    mkdir -p $1 && lynx -dump -listonly -nonumbers $2 | grep $3 | parallel --tag "echo {} 2> /dev/null | sed 's/\///g' 2>/dev/null | xargs -t -i[] google-chrome-stable --disable-gpu --headless --print-to-pdf=$1/[].pdf {}"
}

xcopy()
{
    cat | xclip -selection clipboard
}

xpaste()
{
    xclip -selection clipboard -o
}

function docker-flush
{
    docker rm $(docker ps -a -q);
    docker rmi $(docker images -q);
}
