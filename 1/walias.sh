














    #alias 'wW_grep_1'='grep -GRh $1 ~ | sort | uniq -c | sort -nr >> $2 && tail
    #alias 'wfx'='find ./ -name "*.sh" -exec chmod +x {} \;'
    #alias 'اسحب'='gpo'
    #alias 'اعد'='__r'
    #alias 'برامج'='acs'
    #alias 'دف'='glll'
    #alias 'كيفك'='gst'
    #alias 'من'='who'
    #alias 'نصب'='wi'
    #echo "" && echo "- Alias added  $1 = $2 " && echo "";
    #echo "alias '$1'='$2' " >> $zal
    alias "wwf"="cmdfu"
    alias '00'='$HOME/zdotfiles/0'
    alias '111'='vim ~/zdotfiles/1.sh'
    alias '1111'='bash ~/zdotfiles/1.sh'
    alias '111='vim ~/zdotfiles/1.sh'
    alias '99'='cd ~/zdotfiles/Projects/web2py'
    alias '99_welcome/controllers/default'='cd $HOME/zdotfiles/Projects/web2py/web2py/applications/welcome/controllers'
    alias '99w'='cd /home/abobanihh/zdotfiles/Projects/web2py/web2py/applications/welcome'
    alias 'GX'='grep -iaR "$1"--exclude-dir=cache'
    alias 'W'='echo'
    alias 'Ww_apt-cache_search_xfce4'='apt-cache search xfce4'
    alias 'Ww_aptitude'='sudo aptitude -f'
    alias '___'='sudo su'
    alias '__r'='sudo reboot'
    alias 'agg'='sudo apt-get update && sudo apt-get upgrade'
    alias 'alal'='cmdfu'
    alias 'cdc'='cd $HOME/Dropbox/C/Foundation'
    alias 'cdd'='cd ~/Downloads'
    alias 'cdx'='cd ~/Dropbox/'
    alias 'h'='cd $HOME'
    alias 'kk'='kate'
    alias 'n1'='dpkg --get-selections | grep linux-image'
    alias 'ppa'='sudo add-apt-repository $1'
    alias 'ppp'='sudo add-apt-repository $1'
    alias 'ppr'='sudo add-apt-repository --remove $1'
    alias 'rmm'='rm -rf'
    alias 'vv'='vim ~/zdotfiles/2/.vimrc.local'
    alias 'w7'='ssh'
    alias 'wG'='grep -E "(.*)($1)(.*)($2)(.*)"'
    alias 'wW_grep_1'='grep -GRh $1 ~ | sort | uniq -c | sort -nr >> $2 && tail  $2'
    alias 'wWw'='/usr/bin/python ~/zdotfiles/9/web2py/web2py.py'
    alias 'w_RANDOMi'='echo $[RANDOM % 100]  # range 0-99'
    alias 'w_ak'='autokey -l'
    alias 'wak'='vim $HOME/.config/autokey/data'
    alias 'war'='setxmap -layout ar'
    alias 'wb'='blender --debug'
    alias 'wdev'='hcitool dev'
    alias 'wdr'='vim ~/Dropbox/'
    alias 'wdx'='docx2txt'
    alias 'wen'='setxmap -layout us'
    alias 'wf'='firefox -search'
    alias 'wfbash'='firefox -search bash command line "$@"'
    alias 'wfd'='find -maxdepth 1 -type d'
    alias 'wfw'='python ~/zdotfiles/5/ranger-1.6.1/ranger.py'
    alias 'wh'='tail -3000 ~/.zsh_history | cut -d";" -f2 | sort -u | grep'
    alias 'whis'='cut -f2 -d";" ~/.zsh_history | grep "$1" | sort -u'
    alias 'wi'='sudo apt-get install'
    alias 'wib'='ssh root@192.168.1.$(echo "$1")'
    alias 'wj'='joy2key'
    alias 'wjprayer'='wf "jeddah prayer time"'
    alias 'wjs'='jstest --normal /dev/input/js0'
    alias 'wl'='locate'
    alias 'wlen'='export LANG="en_US.UTF-8" '
    alias 'wml'='env SHELL=zsh mlterm --meta=esc --metakey=alt -E ar_SA.UTF-8 -f=green -b=black -0=green -R=30-40'
    alias 'wmsg'='dmesg | tail -15'
    alias 'wrvs_remove_vim_swap'='rm ~/.vimswap/*'
    alias 'wshut'='sudo shutdown -h now'
    alias 'wsix'='source ~/zdotfiles/1/01/gui_3_bash.sh'
    alias 'wsix_kill_blue'='sudo killall -KILL bluetoothd'
    alias 'wst_string'="read -d '' iz <<"zx"" #Useage : wst_string <Enter> add your strings. Then, close by only typing zx #You can echo $iz
    alias 'wt'='cd ~/tst'
    alias 'wtst'='cd ~/tst'
    alias 'wvb'='wwww $HOME/.vim/bundle'
    alias 'ww'='vim'
    alias 'ww-dmesg-sony'='dmesg | grep sony'
    alias 'ww_check_bluetooth'='hciconfig'
    alias 'ww_chmodX'='chmod +x'
    alias 'ww_chmod_x'='chmod -x'
    alias 'ww_firefox_editor'="firefox 'data:text/html, <html contenteditable>' "
    alias 'wwraw'='sudo sixad-raw /dev/'
    alias 'wws'='PS3="nter a number: "; select f in *;do $EDITOR $f; break; done'
    alias 'www'='wfw'
    alias 'wwww'='cats'
    alias 'wwww_clean_history_get_install'="lg install | sed 's/install//g' | sed 's/^ //g' | sed 's/sudo aptitude//g' | sed 's/^[ ]apt-get//g'| sed 's/^alg.*$//g"
    alias 'wwww_which_ubuntu_dist'='cat /etc/issue'
    alias 'wx'='chmod +x'; alias 'wX'='chmod -x'
    alias 'x'='exit'
    alias 'z'='vim $HOME/zdotfiles/1/.zsh/al.zsh && source $HOME/zdotfiles/1/.zsh/al.zsh'
    alias 'zzzz'=' vim $HOME/.zshrc && source $HOME/.zshrc'
    alias -g 'Gx'='--exclude-dir=cache .'
    alias -g 'H'="--help"
    alias -g 'wH'="--help | grep "
    alias -g 'wxc'='| xclip'
    alias -g G='| grep'
    alias -g Gh='--help | grep'
    alias -g wv='| vim -'
    alias ......='cd ../../../../../'
    alias .....='cd ../../../../'
    alias ....='cd ../../../'
    alias ...='cd ../../'
    alias ..1='cd ..'
    alias ..2='cd ../../../'
    alias ..3='cd ../../../../'
    alias ..4='cd ../../../../'
    alias ..5='cd ../../../../../'
    alias ..='cd ..'
    alias 1='cd -'
    alias __="sudo"
    alias a2-restart='sudo service apache2 restart'
    alias a2r='/etc/init.d/apache2 restart'
    alias aa='git add -A .'
    alias acs='apt-cache search'
    alias acsh='apt-cache show'
    alias agdu='sudo apt-get dist-upgrade'
    alias agi='sudo apt-get install'
    alias agr='sudo apt-get remove'
    alias agu='sudo apt-get update'
    alias al='alias | grep'
    alias aliasupdt='wget -q -O - "$@" https://alias.sh/user/1110/alias >> ~/.bash_aliases'
    alias assume='git update-index --assume-unchanged'
    alias c=clear
    alias cathtml='sed '\''s/<[^>]*>//g'\'
    alias cats='pygmentize -O style=monokai -f console256 -g'
    alias cbuild='mkdir build && cd build; cmake ..; make'
    alias ccat='pygmentize -O bg=dark'
    alias cgrep='grep --color=always'
    alias clip='xclip -sel clip'
    alias co='git checkout '
    alias confcat='sed -e '\''s/[#;].*//;/^\s*$/d'\'' '
    alias convert_pdf='abiword --to=pdf '
    alias cp='cp -i'
    alias cpf='sudo aptitude clean && sudo aptitude purge && sudo aptitude -f install'
    alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
    alias d='dirs -v | head -10'
    alias ddel='rm -Rf'
    alias dfree='df -h -x tmpfs'
    alias display='less +F'
    alias eg='git config -e'
    alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash'
    alias erase='shred -n 35 -z -u'
    alias fpy='find . -name "*[py]" -exec grep -is /dev/null $1 {} \;'
    alias frc='find . -name "*[rc]" -exec grep -is /dev/null $1 {} \;'
    alias freenodetor='dig +short irc.tor.freenode.net cname'
    alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
    alias fsh='find . -name "*[sh]" -exec grep -is /dev/null $1 {} \;'
    alias ftx='find . -name "*[txt]" -exec grep -is /dev/null $1 {} \;'
    alias fwn='find -wholename'
    alias g=git
    alias ga='git add'
    alias gb='git branch'
    alias gba='git branch -a'
    alias gc='git commit -v'
    alias gca='git commit -v -a'
    alias gcl='git config --list'
    alias gcm='git checkout master'
    alias gco='git checkout'
    alias gcount='git shortlog -sn'
    alias gcp='git cherry-pick'
    alias gd='git diff'
    alias get='git '
    alias gfind='find . -print0  | xargs -0 egrep -I '
    alias gg='sr google -browser='
    alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
    alias ggpush='git push origin $(current_branch)'
    alias gl='git pull'
    alias glg='git log --stat --max-count=5'
    alias glgg='git log --graph --max-count=5'
    alias glgga='git log --graph --dcorate --all'
    alias globurl='noglob urlglobber '
    alias gm='git merge'
    alias go='git checkout '
    alias gp='git push'
    alias gpl='git pull'
    alias gpm='git push origin master'
    alias gpo='git pull origin'
    alias gpoat='git push origin --all && git push origin --tags'
    alias gpu='git push'
    alias gr='git remote'
    alias grep='grep --color=auto'
    alias grh='git reset HEAD'
    alias grhh='git reset HEAD --hard'
    alias grmv='git remote rename'
    alias grphp='ps -auwx | grep php'
    alias grrm='git remote remove'
    alias grset='git remote set-url'
    alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
    alias grup='git remote update'
    alias grv='git remote -v'
    alias gs='git status'
    alias gsd='git svn dcommit'
    alias gsl='git shortlog -nsw -e'
    alias gsr='git svn rebase'
    alias gss='git status -s'
    alias gst='git status'
    alias gt='git stash'
    alias gup='git pull --rebase'
    alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
    alias gx='gitx --all'
    alias heroku='nocorrect heroku'
    alias hh='history -$1 | grep'
    alias hh='history | grep --color=auto'
    alias hpodder='nocorrect hpodder'
    alias ifconfig-ext='curl ifconfig.me'
    alias install='sudo apt-get install'
    alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
    alias ips='ifconfig -a | grep -o '\''inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)'\'' | sed -e '\''s/inet6* //'\'
    alias ipy='python -c '\''import IPython; IPython.frontend.terminal.ipapp.launch_new_instance()'\'
    alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
    alias k9='kill -9'
    alias k='gitk --all &'
    alias lba='cd ~/Library/Application\ Support/LaunchBar/Actions'
    alias listips='nmap -sP 192.168.1.1/24'
    alias lldu='find -maxdepth 1 -mindepth 1 -type d -exec du -sh {} \;'
    alias lle='ll --sort=extension'
    alias llocal='ifconfig eth0 | grep inet6'
    alias llr='ll -R'
    alias llt='ll --sort=time'
    alias lns='ln -s'
    alias localip='ipconfig getifaddr en1'
    alias logs='tail -n30 /var/log/apache2/error.log'
    alias md='mkdir -p'
    alias netstat='netstat -pantu'
    alias no-assume='git update-index --no-assume-unchanged'
    alias poogle='ping google.com'
    alias ppm='git push origin master'
    alias process='ps -ax'
    alias prs='ps faux|grep -v grep|grep "$@"'
    alias psf='ps auxf'
    alias psg='ps -ef |grep '
    alias qless='qstat -u "*" | less'
    alias rd=rmdir
    alias remove='sudo apt-get remove'
    alias snlcp='tr -d "\n" | pbcopy'
    alias source-private-aliases='source <(wget -t 3 -q -O - "$@" https://alias.sh/user/$ALIAS_SH_USER_ID/alias/key/$ALIAS_SH_USER_KEY)'
    alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
    alias tm='ps -ef | grep'
    alias uncomment='egrep -v "^#|^$"'
    alias unzip-all='7z x -y '\''*.zip'\'
    alias up_master='git push origin master'
    alias wfreq='cut -f1 -d" " ~/.zsh_history | sort | uniq -c | sort -nr | head -n 30'
    alias wwfreq='cat ~/.zsh_history  | head -n 300'
    alias xclip='xclip -selection c'
    alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"
#
#!/bin/bash
####################################################
#####################################################
#alias 'wgt'='grep --color=always -nr "$1" --include=*txt'
#alias -g 'wcl'='wc -l'
alias "wwf"="cmdfu"
alias 'war'='vim -A ~/zdotfiles/1/z_arabic.sh;source ~/zdotfiles/1/z_arabic.sh'
alias 'war'='vim -A ~/zdotfiles/arabic.zsh'
alias 'wara'='source ~/zdotfiles/arabic.zsh'
alias 'web2py'='cd ~/web2py && python web2py.py -a "w" -i 127.0.0.1 -p 8001'
alias 'wgc'='git clone'
alias 'wmd'='cd /media/ahmed/Transcend/backup/tst'
alias 'wml'='env SHELL=sh mlterm --meta=esc --metakey=alt -E=ar_SA.UTF-8'
alias 'wmm'='/media/ahmed/Transcend/backup/tst/Projects'
alias 'wres'='rename "s/ /_/g" *.*'
alias 'wsr'='cd ~/src'
alias 'ww_tail_zsh_history'='tail -3000 ~/.zsh_history | cut -d";" -f2'
alias 'www_easy_enable'='easystroke enable'
alias 'www_easystroke_disable'='easystroke disable'
alias 'www_get_website'='wget --recursive --page-requisites --convert-links'
alias 'wxd'='lynx -dump'
