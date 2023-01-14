# install -> i
alias iftpserver='sudo apt install vsftpd'
alias isshserver='sudo apt-get install openssh-server'
alias ierd='sudo apt install graphviz && apt install graphviz-dev && pipenv install pyparsing pydot && pipenv install django-extensions'

# notify
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# alias
alias alias-f="declare"
alias alias-F="declare -F"

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# list
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
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

# service -> ss
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

# ftp
alias ftph='ftp $(hostname)'
alias scstartftp='scstart vsftpd'
alias sceftp='sce vsftpd'
alias scrftp='scr vsftpd'

# ssh
alias scstartssh='scstart ssh'
alias scessh='sce ssh'

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
alias tempopenportftp='sudo ufw allow 20/tcp && sudo ufw allow 21/tcp'

# task -> t
alias tftpserver='iftpserver && scstartftp && sceftp && tempopenportftp '
alias tsshserver='isshserver && scessh && scstartssh'
