
# apt-cyg setting
alias apt-cyg='apt-cyg -m ftp://ftp.jaist.ac.jp/pub/cygwin/ -c /package'

export VIM=~/install/share/vim
export VIMRUNTIME=$VIM/vim73

#export PATH=/usr/local/bin:$PATH
export PATH=~/install/bin:$PATH

# rbenv setting
if [ -e $HOME/.rbenv ] ; then
    export PATH=~/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi

# python virtualenv setting
if [ -e /bin/virtualenvwrapper.sh ] ; then
    export WORKON_HOME=$HOME/.virtualenvs
    source virtualenvwrapper.sh
fi

export TERM=xterm-256color

[ ${STY} ] || screen -rx || screen -D -RR

if [ -f $HOME/.zshrc.local ] ; then
    source $HOME/.zshrc.local
fi

