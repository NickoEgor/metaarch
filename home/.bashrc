[[ $- == *i* ]] || exit

PS1='\[\033[1;34m\][\u@\h \W]\$ \[\033[0m\]'

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
