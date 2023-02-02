# install -> i
alias ipy3="sudo apt install python3-pip"
alias icowsay="sudo apt install cowsay"
alias iftpserver='sudo apt install vsftpd'
alias isshserver='sudo apt-get install openssh-server'
alias iapache2server="sudo apt install apache2"
alias itmux="sudo apt-get install -y tmux"
alias iunzip="sudo apt install unzip"
alias ilibtmux="pip install --user libtmux"
alias iptpython="pip install --user ptpython"
alias ipysftp="pip install pysftp"
alias igdown="pip install -q gdown"
alias itorch="pip install torch"
alias ipl="pip install pytorch-lightning"
alias ierd='sudo apt install graphviz && apt install graphviz-dev && pipenv install pyparsing pydot && pipenv install django-extensions'

# high level customization
CD ()
{
    eval "mkdir -p $1 && cd $1"
}


# kernel -> k
alias kwhat="type -a"
alias kos="uname"
alias kv="uname -r"
alias kV="cat /proc/version"
alias knet="nmcli"
alias knet-advanced="sudo tcpdump -D"
alias knet-device="nmcli device status"
alias knet-condev="knet-device | grep connected | kf-split 1"
alias knet-tc-advanced="sudo iptraf-ng"
alias kcpu="cat /proc/cpuinfo"
alias khost="hostnamectl"
alias kcg-tree="systemd-cgls"
alias kcg-controllers="cat /proc/cgroups"
alias kcg-controllers-advanced="lssubsys"
alias kcg-controllers-advanced-paths="lssubsys -M"
alias kcg-controllers-advanced-paths-only="kcg-controllers-advanced-paths | grep '\/.*' -o | grep ''"
alias kmerge="cat ./* > merged"
alias kmerge-ckpt="kmerge && unzip ./merged"
alias kpo="fwop"
alias kpc="fwcp"
kf-pls ()
{
	set -- "${1:-}" "${2:-ltnp}"
	eval "sudo netstat -$2 | grep -w '.*$1' | grep ''"
}

kf-split ()
{
	set -- "${1:-0}" "${2:- }"
	while read -r line; do
        	local data="$data $line"
    	done
	local data=$(echo $data | tr '\n' ' ' | xargs)
	if [ "$1" -eq "0" ]; then
   		echo $data;
   		exit;
	fi
	echo $(echo $data | cut -d"$2" -f$1)
}

# notify
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# alias
alias py="ptpython"
alias alias-f="declare"
alias alias-F="declare -F"
alias alias-g="alias | grep"
alias-def ()
{
    eval "alias $1=\"$2\""
}


# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# list
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alFh'
alias ls='ls --color=auto'

# link
alias hln="ln" # hln src dst
alias sln="ln -s" # sln src dst

# filesystem
alias mkp='mkdir -p'

# ps
alias ps1='ps -p 1 -o comm='

# user -> u
alias uadd='sudo useradd -m '

# systemctl -> sc
alias sc='sudo systemctl'
alias scs='sudo systemctl status '
alias scd='sudo systemctl disable '
alias sce='sudo systemctl enable '
alias scr='sudo systemctl restart '
alias scstart='sudo systemctl start '
alias scstop='sudo systemctl stop '
alias scfSD='sudo systemctl --type=service --state=dead'
alias scfSE='sudo systemctl --type=service --state=exited'
alias scfSF='sudo systemctl --type=service --state=failed'
alias scfSI='sudo systemctl --type=service --state=inactive'
alias scfSR='sudo systemctl --type=service --state=running'

# service -> ss | Reserved: ss
alias ssrftp='ssr vsftpd'
ssr ()
{
    echo $(sudo service $1 restart)
}
sss ()
{
    echo $(sudo service $1 status)
}
ssstart ()
{
    echo $(sudo service $1 start)
}
ssstop ()
{
    echo $(sudo service $1 stop)
}

# firewall -> fw
alias fwcp='sudo ufw deny '
alias fwop='sudo ufw allow '

# apache2
alias apache2r="sudo /etc/init.d/apache2 restart"

# ftp
alias ftph='ftp $(hostname)'
alias scstartftp='scstart vsftpd'
alias sceftp='sce vsftpd'
alias scrftp='scr vsftpd'
wgetftp ()
{
	set -- "${1:-/}" "${2:-/}" "${3:-localhost}" "${4:-root}" "${5:-toor}"
	eval "wget -r \"ftp://$3/$1\" --ftp-user=\"$4\" --ftp-password=\"$5\" -P \"$2\""
}
pemsftp ()
{
        set -- "${1:-}" "${2:-~/VPS/ac-fum-privateKey.pem}" "${3:-5.160.40.35}" "${4:-ubuntu}"
        eval "sudo sftp -P $1 -i $2 $4@$3"
}


# ssh
alias scstartssh='scstart ssh'
alias scessh='sce ssh'
alias rsapubssh="sudo cat ~/.ssh/id_rsa.pub"
pemssh ()
{
        set -- "${1:-}" "${2:-~/VPS/ac-fum-privateKey.pem}" "${3:-5.160.40.35}" "${4:-ubuntu}"
        eval "sudo ssh -i $2 $4@$3 -p $1"
}

# projects -> P
alias Pgml="wget 'https://raw.githubusercontent.com/halfbloodprincecode/GENIE_ML/master/index.bash' -O 'GENIE_ML_index.bash' && sudo bash ./GENIE_ML_index.bash"

# tmux -> T
alias Tserver="tmux start-server"
alias Tkserver="tmux kill-server"
alias Tls="tmux list-session"
alias Tcr-without-s="tmux new-session -d"
alias Tcr="tmux new-session -d -s " # -s session_name | optional: -n window_name
alias Tup="tmux attach-session -t " # session_name
alias Tdn=""
alias Tdel="tmux kill-session -t " # session_name
alias Trename="tmux rename-session -t" # current_session_name new_session_name

# mysql
alias scstartmysql='scstart mysql.service'

# git -> g | Reserved -> alias gt='ssh -T git@gitlab.com'
alias g='ga && gc'
alias ga='git add .'
alias gb='git checkout '
alias gbD='git branch -D '
alias gbd='git branch -d '
alias gbds='git push -d '
alias gbf='git checkout -b'
alias gbv='git branch -v'
alias gbva='git branch -a'
alias gc='git commit -m '
alias gcc='git commit --amend -m '
alias gclear='git rm -r --cached '
alias gg='ga && gcc'
alias gl='git log'
alias gl1='git log --oneline'
alias glr='git remote -v'
alias glt='git log --branches --remotes --tags --graph --oneline --decorate'
alias gp='git push'
alias gpull='git pull'
alias gr1='git reset --hard HEAD~1'
alias grh='git reset --hard '
alias grs='git reset --soft '
gmerge () 
{ 
    echo $(grh $1 && gcc $2)
}

# django(python manage) -> pm
alias pm='python manage.py'
alias pm2m='python manage.py makemigrations'
alias pmapp='python manage.py startapp '
alias pmcs='python manage.py collectstatic --noinput'
alias pmdbsh='python manage.py dbshell'
alias pmdd='python manage.py dumpdata'
alias pmerddot='python manage.py graph_models -a > documentation/ERD.dot'
alias pmerd='pmerddot && python manage.py graph_models --pydot -a -g -o documentation/ERD.png'
alias pmdoc='mkp documentation && pmerd'
alias pmld='python manage.py loaddata'
alias pmm='python manage.py migrate'
alias pmmg='pm2m && python manage.py migrate'
alias pmrs='python manage.py runserver'
alias pmsh='python manage.py shell'
alias pmsm='python manage.py sqlmigrate auth 0001'
alias pmsync='python manage.py syncdb --noinput'
alias pmt='python manage.py test'
alias pmu='python manage.py createsuperuser'
alias pmurp='python manage.py changepassword '
pmseed () 
{ 
    echo $(python manage.py seed $1 --number=$2)
}
pmsql () 
{ 
    echo $(python manage.py makemigrations $1 --empty)
}

# temp
alias tempopenportftp='fwop 20/tcp && fwop 21/tcp'

# task -> t
alias tftpserver='iftpserver && scstartftp && sceftp && tempopenportftp '
alias tftpserver-colab="iftpserver && /etc/init.d/vsftpd start"
alias tsshserver='isshserver && scessh && scstartssh'
alias tfum="ipy3 && iptpython && icowsay && tftpserver && iapache2server && itmux && ilibtmux && iunzip && igdown && ipysftp && itorch && ipl"
