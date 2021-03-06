#!/bin/zsh


########################################################
# Author : AHMED BANI
#####################################################
##
##
#####################################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

alias 'wi'='sudo apt-get install'

msg() {
    printf '%b\n' "$1" >&2
}


success() {
    msg "\e[32m[✔]\e[0m ${1}${2}"
}


error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
}


debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
      msg "An error occured in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}


Confirm() {
    echo -n "$1 [y/n]?";
    read reply;
    case $reply in
        Y*|y*)
        true
        ;; *)
            false ;;
    esac
}

zselect() {
    PS3="Enter a number: "
    select f in "$@";do
        #$EDITOR $f;
        echo $f
    break;
    done
}

wWw_diff() {
    diff -y <(echo "$1") <(echo "$2") | vim - ;
}


success() {
    msg "\e[32m[✔]\e[0m ${1}${2}";
}


wwww() {
    pygmentize $1 | less -N;
}

alias 'x'="exit"
alias 'wWw__exit'="exit"
alias 'wWw__zsh'="zsh"

#AMD/ATI
W_AMD_VGA(){
    lspci | grep VGA
    sudo lshw -C video
}

ZSRC=$(find ~/zdotfiles/link -exec basename {} \;)
DHOME=$(find ~/ -type l -exec basename {} \;)
WROOT=$(find . -user root)

w() {
    clear
    success "Symlinks at HOME = " "$(echo $DHOME | wc -l)"
    success "Dotfiles at zdotfiles/link = " "$( echo $ZSRC | wc -l )";
    success "Root files = " "$(echo $WROOT | wc -l)";
    echo "$(echo $WROOT)";
}

cmdfu() {
    curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" --silent | vim -R - ;
}

setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ar
setxkbmap -option ctrl:nocaps

alias "wWw___eeasystroke"="easystroke -c ~/zdotfiles/link/.easystroke"

alias 'W_00_acs'='apt-cache search'
alias 'wWw___acsh'='apt-cache show'

alias "ww"="vim"

#alias 'wW'='ls -RlhFAa | egrep ">" | wc -l'

alias 'wi_install'='sudo apt-get install'
alias 'wx'='chmod +x'; alias 'wX'='chmod -x'

alias 'www'='python ~/zdotfiles/5/ranger-1.6.1/ranger.py'

#easystroke -c ~/zdotfiles/link/.easystroke

WWWWWWW_reboot() {
    sudo reboot;
}

alias listips='nmap -sP 192.168.1.1/24'


wWW_findzdotfiles()
{
    find ~/zdotfiles -name "$1" -type f -print | xargs egrep --color=always "$2";
}

alias -g wv='| vim -'
alias -g 'H'="--help"
alias -g G='| grep'
alias -g H='|head'

alias "w__zsh"="zsh"
alias "ww_bashrc"="vim $HOME/.bashrc"
alias 'wwww'="pygmentize"
alias 'agg'='sudo apt-get update && sudo apt-get upgrade'



#alias -g M='|more'
#alias -g T='|tail'

# Matching Strings
#grep -l <string-to-match> * | xargs grep -c <string-not-to-match> | grep '\:0'

# Deleting directory recurcive. Directories will be deleled when empty or contains only .svn subdirectory
#for I in $(find . -depth -type d -not -path  "*/.svn*" -print) ; do N="$(ls -1A ${I} | wc -l)"; if [[ "${N}" -eq 0 || "${N}" -eq 1 &&  -n $(ls -1A | grep .svn) ]] ; then svn rm --force "${I}"; fi ; done
#find . -type f ! -perm /u+x -printf "\"%p\"\n"
today=`date +%Y_%m_%d_%h_%s`

function w()
{
    clear;ls -al;date;pwd
    echo "$TERM"
    echo "$SHELL"
}
source ~/zdotfiles/1/z_arabic.sh
#source ~/zdotfiles/1/.zsh/a


show_code()
{
    pygmentize $1 | less -N }

www_ak_add()
{
    echo "$1" > $HOME/.config/autokey/data/MyPhrases/ww/"$2"
}


www_rename()
{
    ls -1 | while read file; do
    new_file=$(echo $file | sed s/\ /_/g) && mv "$file" "$new_file"; done;
}

www_wget()
{
    wget --recursive  --page-requisites --convert-links
}

setup_git_push_default() {
    git config --global push.default current
}


git_config_global() {
    git config --global user.name 'Ahmed Al-Ghamdi'
    git config --global user.email 'tazjel@gmail.com'
    git config --list
    git config --global color.ui auto
    git config --global credential.helper cache
    git config --global credential.helper 'cache --timeout=3600'
}

ssh-keygen_rsa() {
    ssh-keygen -t rsa -C 'tazjel@gmail.com'
    xclip -sel clip < ~/.ssh/id_rsa.pub
    ssh -T git@github.com
}

git_clone() {
    git clone git@github.com:tazjel/zdotfiles.git
    cd zdotfiles
    git remote add upstream git@github.com:tazjel/zdotfiles.git
    git remote set-url origin git@github.com:tazjel/zdotfiles.git
    git fetch upstream
}

############################

set_xkeyboard() {
    if [[ $(uname) = "Linux" ]];then
        #easystroke show
        setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ar
        setxkbmap -option ctrl:nocaps
    fi
}

set_xkeyboard

is_linux()
{
    if [[ $(uname) = "Linux" ]];then
        echo "Yes"
        #easystroke show
        set_xkeyboard
    fi
}


star_Level_one()
{
    echo -e "\t\t بسم الله الرحمن الرحيم | ماشاء الله ولا قوة الابالله"
}
#
# vi style incremental search
    export EDITOR="vim"
    bindkey -v

    bindkey '^R' history-incremental-search-backward
    bindkey '^S' history-incremental-search-forward
    bindkey '^P' history-search-backward
    bindkey '^N' history-search-forward




wwww_pdf()
{
    for i in *.pdf; do echo --------$i-------; echo
        pdftotext $i - | grep -i $1
    done
}


compare_two_doc()
{
    meld <(antiword microsoft_word_a.doc) <(antiword microsoft_word_b.doc)
}

wwww_doc()
{
    for I in *.doc; do
        echo "-------- $i -------";
        echo ""
        catdoc $i - | grep -i "$1";
    done
}

########################################################
# F2
########################################################
# <F3>

wg_txt() {
    find . -type f -and -iregex '.*\.txt$' -and -print0 -exec grep --color=always -Hn "$1" {} \;
}

function sw ()
{
    today=`date +%Y_%m_%d_%h_%s`
    scrot '$today_srot.png' -e 'mv $f ~/images/shots/'
}

function wsw()
{
    today=`date +%d_%s`;echo $today; scrot "$today"_shot.png -e 'mv $f ~/images/shots/';ls ~/images/shots
}

function wpw_capture_pic_every_2 () {
    i=0;while :; do i=$(expr "$i" + 1); scrot "$i".png; sleep 2; done;
}
function zbp {
    mkdir -p $HOME/Dropbox/zzz_bkp
    for xx in ~/.* ;do
    rsync -avz --progress --exclude=.cache --exclude=~/.config/chromium --exclude=~/.config/google-chrome/ $HOME/.* /media/ahmed/Transcend/backup/newbkp
    echo $xx
done;
}
function wsix_lsusb_dmesg_hcitool {
    lsusb;dmesg;hcitool dev;hcitool con;
    echo " بسم الله ما شاء الله"
}
function WWW {
    desc="ADD DESCRIPTION..."
    if [ -n "$3" ]; then
        desc="$3"
    fi
    echo "" >> $HOME/Dropbox/C/Foundation/inbox.txt
    echo "# $desc" >> $WWW_path
    echo '# "$1"="$2" ' >> $WWW_path
    tail -7 $WWW_path
}

function wW_grep_logs(){
    grep "$1" */logs/*.log
}

function WW() {
    zal=~/zdotfiles/1/.zsh/al.zsh
    desc="ADD DESCRIPTION..."
    if [ -n "$3" ]; then
        desc="$3"
    fi
    if [ -e "$zal" ]; then
        echo "" >> $zal
        tail $zal
        source $zal
    fi
}

function ww-bluetooth_restart {
    sudo service bluetooth restart;
}


cmdfu()
{
    curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" --silent | vim -R -;
}



wwws () {
    PS3="Enter a number: "
    select f in $1;do
        echo $f;
        break;
    done;
}


function wwrename {
    for file in * ; do
    mv "$file" `echo "$file" | tr ' ' '_' | tr '[A-Z]' '[a-z]'`;
    done;
}

function Wbkp()
{
    for xx in ~/.* ;do
        rsync -avz --progress $HOME/.* $HOME/zzz_bkp
        ls -alt > ~/zdotfiles/1/.zsh/Inbox_Home_dotfiles.txt
        echo $data >> ~/zdotfiles/1/.zsh/Inbox_Home_dotfiles.txt
    done;
}
extract_url_links (){
    for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" $1 | sed "s/^'\///g" | sed "s/'$//g");do echo $i;done;
}

wds_compare_strings() {
    string="$@"
    if [[ "$1" == *"$2"* ]];then
        echo "It's there!"
    fi
        echo "No"
}

function W_file_size () {
    ls -lhR | grep -e "total\|:$"
} # List directories recursively showing its sizes using only ls and grep

function ww10 {
    for i in $(seq 1 10);do
        echo $i
    done
}

function alg () {
    grep $1 $HOME/.zsh_history | sed 's/^.*;//g'
}

glll()
{
    cd $HOME/zdotfiles
    git add -A
    git commit -a
    git push --all
    git push origin --all && git push origin --tags
}


wpkl()
{
    dpkg --get-selections > ~/zdotfiles/0/packages-alpha${today};
}

wssh ()
{
    listips | grep "for" | cut -d' ' -f5,6 | sed 's/^\(.*\) (\(.*\))/ssh
    \1@\2/g'
}
listip_ssh () {
    listips | grep "for" | cut -d' ' -f5,6 | sed 's/^\(.*\) (\(.*\))/ssh root@\2:\/home\/\1/g'
}

www_lynx() {
    lynx -dump $1 | awk '/http/{print $2}' | egrep "^https{0,1}"
}


ww_colors_term()
    {for code in $(seq -w 0 255); do for attr in 0 1; do printf
    "%s-%03s %bTest%b\n" "${attr}" "${code}" "\e[${attr};38;05;${code}m"
    "\e[m"; done; done | column -c $((COLUMNS*2))
}


######################################## Main

# Start-up
star_Level_one
echo -e "\t\t\t\t $(date)"

#cat /home/ahmed/zdotfiles/4/time/jeddah-pt | grep "^$(date '+%d')"

############################################################################################################################################################


wbook() {
    egrep "$1" /home/ahmed/Dropbox/C/Foundation/books.txt | grep -oG ").\(.*\)" | sed 's/).\s\+\(.*\)/\1/g'
}

fbook() {
    egrep "$1" /home/ahmed/Dropbox/C/Foundation/book-DCAR
}


wy_readline()
{
    tail -F /var/log/nginx/access.log | python -c 'exec("import sys,time\nl=0\ne=int(time.time())\nfor line in sys.stdin:\n\tt = int(time.time())\n\tl += 1\n\tif t > e:\n\t\te = t\n\t\tprint l\n\t\tl = 0")'
}

ww_sed_wy_append_line()
{
    # Append the line # -*- coding: utf-8 -*- to a file
    sed -i -e '1i \# -*- coding: utf-8 -*-';
}


# Dropbox login using only curl, sed and bash
#link=https://www.dropbox.com/login ; curl -b a -c cookie -d "t=$(curl -c a $link | sed -rn 's/.*TOKEN: "([^"]*).*/\1/p')&login_email=me%40yahoo.com&login_password=my_passwd" $link
# english <--> german translation with dict.leo.org
#leo() { lang=en; IFS=+; Q="${*// /%20}"; curl -s "https://dict.leo.org/${lang}de/?search=${Q//+/%20}" | html2text | grep -EA 900 '^\*{5} ' | grep -B 900 '^Weitere Aktionen$';}


wpic()
{
    while true; do sleep 3; scrot '%Y-%m-%d-%s_$wx$h_wscrot.png' -e 'mv $f ~/images/shots/'; ls ~/images/shots;done
}



#echo ${TERM}

alias "w_term_colors"="msgcat --color=test"

alias 'wchmod-400-only'='chmod 400 ~/.ssh/id_rsa'
alias 'wgit_set-url_origin'= 'git remote set-url origin git@github.com:tazjel/zdotfiles.git'

#dmesg -T|sed -e 's|\(^.*'`date +%Y`']\)\(.*\)|\x1b[0;34m\1\x1b[0m - \2|g'
Undo_commit()
{
    git commit
    git reset --soft 'HEAD^'
    # edit
    git add
    git commit -c ORIG_HEAD
}

function xremindme()
{
    sleep $1 && zenity --info --text "$2" &
}


wfg() {
    SPROMPT="$fg[red]%R →$reset_color $fg[green]%r? (Yes, No, Abort, Edit) "
    echo "$fg[red]$PWD"
    SPROMPT="$fg[red]%R →$reset_color $fg[green] :"
    echo ""; echo $SPROMPT "$1"
}
#

alias mv="mv --verbose --interactive"
alias cp="cp --verbose --interactive"
alias rm="rm --verbose --interactive=once"
alias ln="ln --verbose --interactive"

alias chmod="chmod --verbose --preserve-root"
alias chgrp="chgrp --verbose --preserve-root"
alias chown="chown --verbose --preserve-root"
alias mkdir="mkdir --verbose"


function zfind_size() {
    find -name "*.*" -print0 | du -hc --files0-from=-
}


# paste this in your ~/.bashrc
myip ()
    {
    clear
    echo
    echo ” ip local: `hostname -I`”
    echo ” router: `route -n | awk ‘/UG/ {print $2}’`”
    echo ” external ip: `curl –connect-timeout 4 -s sputnick-area.net/ip`”
    echo
    read -sn 1 -p ” Press any key to continue…”
    clear
}


alias "www_unmute_audio"="amixer -c 0 set Master 1+ unmute"
alias wabout="lsb_release -a"

######################################## Main

# Start-up
star_Level_one
#cat /home/ahmed/zdotfiles/4/time/jeddah-pt | grep "^$(date '+%d')"
echo -e "\t\t\t\t $(date)"

alias www__zshrc="vim ~/.zshrc && source ~/.zshrc"
alias ww_al="vim ~/zdotfiles/1/.zsh/al.zsh && source ~/zdotfiles/1/.zsh/al.zsh"
alias ww_vimrc_local="vim ~/.vimrc.local && source ~/.vimrc.local"
alias ww_vimrc="vim ~/.vimrc && source ~/.vimrc"

    #<(find $HOME/zdotfiles/link -maxdepth 1 -type f -iname "$2");

www_colordiff()
{
    colordiff -yr <(find $HOME/. -type l -maxdepth 1 -exec basename {} \;) <(find $HOME/zdotfiles/link -maxdepth 1 -exec basename {} \;)
}
#z_colordiff "$1" "$2"
WWW_find_sh() { find . -name "*sh" -exec grep -is "$1" {} \; }

WWW_find_py() { find . -name "*py" -exec grep -is "$1" {} \; }
WWW_find_vim() { find . -name "*vim" -exec grep -is "$1" {} \; }

wwww_easystroke() {
    if [ -n "`pgrep easystroke`" ]; then
        echo "easystroke is On" && kill -KILL $(pgrep easystroke)
    else
        echo "easystroke is Off"
        easystroke -c $HOME/zdotfiles/link/.easystroke && echo "running easystroke"
    fi
}


alias colorize='colorize_via_pygmentize'

colorize_via_pygmentize() {
    if [ ! -x $(which pygmentize) ]; then
        echo package \'pygmentize\' is not installed!
        exit -1
    fi

    if [ $# -eq 0 ]; then
        pygmentize -g $@
    fi

    for FNAME in $@
    do
        filename=$(basename "$FNAME")
        lexer=`pygmentize -N \"$filename\"`
        if [ "Z$lexer" != "Ztext" ]; then
            pygmentize -l $lexer "$FNAME"
        else
            pygmentize -g "$FNAME"
        fi
    done
}

echo "from al.zsh"
