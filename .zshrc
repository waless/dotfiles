
# apt-cyg setting
alias apt-cyg='apt-cyg -m ftp://ftp.jaist.ac.jp/pub/cygwin/ -c /package'

export VIM=~/install/share/vim
export VIMRUNTIME=$VIM/vim73

export PATH=/usr/local/bin:$PATH
export PATH=~/install/bin:$PATH

# rbenv setting
export PATH=~/install/rbenv/bin:$PATH
eval "$(rbenv init -)"

export TERM=xterm-256color

export PATH

[ ${STY} ] || screen -rx || screen -D -RR

