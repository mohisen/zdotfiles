alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias ..1='cd ..'
alias ..2='cd ../../../'
alias ..3='cd ../../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'
alias 1='cd -'
alias 2='cd +2'
alias 2d='cd ../../'
alias 3='cd +3'
alias 3d='cd ../../../'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'
alias ANYNAMEHERE=' ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'
alias W=cat
alias a2-restart='sudo service apache2 restart'
alias a2r='/etc/init.d/apache2 restart'
alias aa='git add -A .'
alias acs='apt-cache search'
alias acsh='apt-cache show'
alias active='grep -v -e "^$" -e"^ *#"'
alias agdu='sudo apt-get dist-upgrade'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update'
alias al='alias | grep'
alias aliasupdt='wget -q -O - "$@" https://alias.sh/user/1110/alias >> ~/.bash_aliases'
alias assume='git update-index --assume-unchanged'
alias back='cd -'
alias bbc='mplayer http://www.bbc.co.uk/worldservice/meta/live/mp3/eneuk.pls'
alias build='mkdir build ; cd build && cmake .. && make ; cd .. && ls'
alias c=clear
alias cat='pygmentize -O style=monokai -f console256 -g'
alias cathtml='sed '\''s/<[^>]*>//g'\'
alias cbuild='mkdir build && cd build; cmake ..; make'
alias ccat='pygmentize -O bg=dark'
alias cd='HOME="$OLDPWD" cd'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'
alias cgrep='grep --color=always'
alias clip='xclip -sel clip'
alias clr='clear;pwd;ls'
alias co='git checkout '
alias confcat='sed -e '\''s/[#;].*//;/^\s*$/d'\'' '
alias convert_pdf='abiword --to=pdf '
<<<<<<< HEAD
alias cp='cp -i'
alias cpf='sudo aptitude clean && sudo aptitude purge && sudo aptitude -f install'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias d='git diff|tig'
alias ddel='rm -Rf'
alias edit-aliases='nano ~/.bash_aliases'
=======
alias copy=cp
alias cp='cp -i'
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias cpip='curl -s ifconfig.me | tr -d "\n" | pbcopy'
alias d='git diff|tig'
alias ddel='rm -Rf'
>>>>>>> a8f55d6e6731bd159a0921efcc8ed9291aca805c
alias debinstall='sudo dpkg -i '
alias del='rm -i'
alias dfree='df -h -x tmpfs'
alias dir=ls
alias display='less +F'
alias dl='cd ~/Downloads'
alias dropbox_conflicts='find ~/Dropbox -name \*conflicted\ copy\*'
<<<<<<< HEAD
=======
alias drupal-sandbox='drush qd --db-url="mysql://user:pass@localhost:3306/db_name" -y'
alias ds='du -sck * | sort -n'
alias ebuild='nocorrect ebuild'
alias edit-aliases='nano ~/.bash_aliases'
>>>>>>> a8f55d6e6731bd159a0921efcc8ed9291aca805c
alias eg='git config -e'
alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash'
alias erase='shred -n 35 -z -u'
alias fin='find -iname'
alias fn='find -name'
alias freenodetor='dig +short irc.tor.freenode.net cname'
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
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
alias gf='git ls-files | grep'
alias gg='sr google -browser='
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias gist='nocorrect gist'
alias git-root='root="$(git rev-parse --show-cdup)"; [ -n "$root" ] && cd "$root"'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
alias gitlog='git log --graph --all --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n'\'\''          %C(white)%s%C(reset) %C(bold white)— %an%C(reset)'\'' --abbrev-commit'
alias gk='gitk --all&'
alias gl='git pull'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
<<<<<<< HEAD
=======
alias gll='cd /home/bani/zdotfiles/ && git add -A && git commit -a git push origin master'
>>>>>>> a8f55d6e6731bd159a0921efcc8ed9291aca805c
alias globurl='noglob urlglobber '
alias gm='git merge'
alias go='git checkout '
alias got='git '
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
alias h='cd $HOME'
alias heroku='nocorrect heroku'
alias hh='history | grep --color=auto'
alias hpodder='nocorrect hpodder'
alias ifconfig-ext='curl ifconfig.me'
alias install='sudo apt-get install'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ips='ifconfig -a | grep -o '\''inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)'\'' | sed -e '\''s/inet6* //'\'
alias ipy='python -c '\''import IPython; IPython.frontend.terminal.ipapp.launch_new_instance()'\'
alias jpgtopdf='convert *.JPG "$(basename "$(pwd)").pdf"'
alias k='gitk --all &'
alias k9='kill -9'
alias l='ls -ltr'
alias l.='ls -d .* --color=auto'
alias la='ls -A'
alias lba='cd ~/Library/Application\ Support/LaunchBar/Actions'
alias le='ls --sort=extension'
alias lf='ls -Gl | grep ^d'
alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias listips='nmap -sP 192.168.2.0/24'
alias ll='ls -l'
alias lla='ls -lhFA'
alias lldu='find -maxdepth 1 -mindepth 1 -type d -exec du -sh {} \;'
alias lle='ll --sort=extension'
alias lll='ls -alF'
alias llocal='ifconfig eth0 | grep inet6'
alias llr='ll -R'
alias llt='ll --sort=time'
alias lns='ln -s'
alias localip='ipconfig getifaddr en1'
alias logs='tail -n30 /var/log/apache2/error.log'
alias lr='ls -R'
alias lrt='ls -lart'
alias ls='ls --color=tty'
alias lscleanup='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'
alias lsd='ls -Gal | grep ^d'
alias lt='ls --sort=time'
alias man='nocorrect man'
alias md=mkdir
alias mkdir='nocorrect mkdir'
alias mkvenv='virtualenv --distribute --no-site-packages venv'
alias mv='nocorrect mv'
alias myip='curl ip.appspot.com'
alias mysql='nocorrect mysql'
alias netlisteners='lsof -i -P | grep LISTEN'
alias netstat='netstat -pantu'
alias nfas='grep -c "^>"'
alias no-assume='git update-index --no-assume-unchanged'
alias open=xdg-open
alias please=sudo
alias pm='git push origin master'
alias poogle='ping google.com'
alias process='ps -ax'
alias prs='ps faux|grep -v grep|grep "$@"'
alias psf='ps auxf'
alias psg='ps -ef |grep '
alias pubip='curl ifconfig.me'
alias qfind='find . -name '
alias qless='qstat -u "*" | less'
alias rd=rmdir
alias realias='$EDITOR ~/.bash_aliases && source ~/.bash_aliases'
alias refunction='$EDITOR ~/.bash_functions && source ~/.bash_functions'
alias reload='source $HOME/.bashrc 1>/dev/null'
alias remove='sudo apt-get remove'
alias rename=mv
alias rfresh=' rsync -avz --progress -e  "ssh -p 2233" user@110.11.11.11:/your/remote/path /my/local/path'
alias rm='rm -I'
alias sa='ssh-add '
alias sc='screen -S'
alias scp='scp -p'
alias scw='screen -wipe'
alias sdi='sudo dpkg -i'
alias sl='screen -ls'
alias sls='screen -ls'
alias snlcp='tr -d "\n" | pbcopy'
alias source-private-aliases='source <(wget -t 3 -q -O - "$@" https://alias.sh/user/$ALIAS_SH_USER_ID/alias/key/$ALIAS_SH_USER_KEY)'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias sr='screen -r'
alias ss='vim $HOME/.zshrc'
alias ssh-config='nano ~/.ssh/config'
alias sshr='ssh -l root'
alias sud='sudo -s'
alias sulast='su -c $(history -p !-1) root'
alias tarc='tar czvf'
alias tart='tar tzvf'
alias tarx='tar xzvf'
alias temp='/opt/vc/bin/vcgencmd measure_temp'
alias tm='ps -ef | grep'
alias trace=trace
alias tube='display http://www.tfl.gov.uk/assets/downloads/standard-tube-map.gif'
alias uncomment='egrep -v "^#|^$"'
alias unzip-all='7z x -y '\''*.zip'\'
alias up_master='git push origin master'
alias update='sudo apt-get update'
alias update-aliases='wget -q -O - "" https://alias.sh/user//alias > ~/.zsh_alias_sh && source ~/.zsh_alias_sh'
alias update-private-aliases='wget -q -O - "" https://alias.sh/user//alias/key/ > ~/.bash_aliases && source ~/.bash_aliases'
alias upgrade='apt-get update && apt-get upgrade && apt-get clean'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias vb='vim ~/.bashrc; source ~/.bashrc'
alias vi=vim
alias vibash='vi ~/.bashrc; source ~/.bashrc'
alias vv='source ~/.vimrc.bundles.local'
alias vvv='source ~/.vimrc.local'
alias w='ls -alF'
alias wcr='wc `find . -type f`'
alias wget='wget --content-disposition'
alias whead='curl --head $1'
alias which-command=whence
alias wotgobblemem='ps -o time,ppid,pid,nice,pcpu,pmem,user,comm -A | sort -n -k 6 | tail -15'
alias wsulast='sudo $(history -p !-1)'
alias xclip='xclip -selection c'
alias xs='cd `pwd -P`'
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'
alias zshconfig='subl ~/.zshrc'
alias zshrc='vi ~/.zshrc'
alias zz='vim $HOME/.oh-my-zsh/lib/aliases.zsh'
<<<<<<< HEAD
alias zzz='source /home/bani/.oh-my-zsh/lib/aliases.zsh'
alias zzzz=' vim $HOME/.zshrc'


alias zzzzz='source $HOME/.zshrc'
alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"
alias __="sudo"
function ccc {
echo "alias '$1'='$2' " >> /home/bani/.oh-my-zsh/lib/ALIAS_SH_USER_KEYes.zsh
echo "Now, we got : $1 & $2"
source /home/bani/.oh-my-zsh/lib/aliases.zsh
}
#============================================
#
function adal {
desc="ADD DESCRIPTION..."
if [ -n "$3" ]; then
desc="$3"
fi
echo "" >> /home/bani/.oh-my-zsh/lib/aliases.zsh
echo "###" >> /home/bani/.oh-my-zsh/lib/aliases.zsh
echo "##

# $desc #
#" >> /home/bani/.oh-my-zsh/lib/aliases.zsh
echo "#" >> /home/bani/.oh-my-zsh/lib/aliases.zsh
echo "" >> /home/bani/.oh-my-zsh/lib/aliases.zsh
echo "alias '$1'='$2'" >> /home/bani/.oh-my-zsh/lib/aliases.zsh
source /home/bani/.oh-my-zsh/lib/aliases.zsh
echo "" && echo "- Alias added -" && echo ""
}

alias '_r'='sudo reboot'

function glll {
cd /home/bani/zdotfiles
git add -A
git commit -a
git push foreigin master}
# rename files or replace space in filenames in current directories.
alias fnss='find . -depth -name "* *" -execdir rename s/'='/_/g "{}" \;'


# cp alias
#

alias 'zcp'='cp -r /home/bani/.oh-my-zsh/lib/aliases.zsh /home/bani/zdotfiles/zsh/aliases.zsh'

##

alias 'rmm'='rm -rf'

# file #
alias 'tt'='cat'

alias 'tt'='cat'

alias 'n1'='dpkg --get-selections | grep linux-image'

###
##

# only #
#
#

alias 'kla'="ls -a | grep '^\.'"

###
##

# json #
#
#

alias 'klj'='ls -a | grep "^\.\(.*\)n$"'

###
##

# #mk & cd in #
#
#

alias 'mkk'='mkdir -p wwWWww && cd /home/bani/wwWWww/wwWWww'

###
##

# ADD DESCRIPTION... #
#
#

alias 'wW'='pwd'
=======
alias zzz='source $HOME/.oh-my-zsh/lib/aliases.zsh'
alias zzzz=' vim $HOME/.zshrc'
alias zzzzz='source $HOME/.zshrc'
alias xxx="sudo sixpair;sudo sixad --stop;sudo sixad --start"
alias __="sudo"
function ccc {
echo "alias '$1'='$2' " >> /home/bani/.oh-my-zsh/lib/aliases.zsh
echo "Now, we got : $1 & $2"
source /home/bani/.oh-my-zsh/lib/aliases.zsh
}
#============================================
#
alias '_r'='sudo reboot' 


function gll {
cp /home/bani/.oh-my-zsh/lib/aliases.zsh /home/bani/zdotfiles/zsh/aliases.zsh
cd ~/zdotfiles/
git add -A
git commit -a git push origin master
}
>>>>>>> a8f55d6e6731bd159a0921efcc8ed9291aca805c