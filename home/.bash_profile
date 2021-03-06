#!/bin/sh

export PATH="$PATH:$HOME/.scripts:$HOME/.local/bin"
export EDITOR="vim"
export VISUAL="$EDITOR"
export BROWSER="qutebrowser"
export TERMINAL="st"
export READER="zathura"
export SUDO_ASKPASS="$HOME/.scripts/dmenu_pass"
export GREP_COLOR="1;31"
export LESSHISTFILE="-"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export HISTFILE="$XDG_DATA_HOME/bash_history"
export HISTSIZE=
export HISTFILESIZE=

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ $(tty) = "/dev/tty1" ]]; then
	pgrep -x i3 || exec startx 1>/dev/null 2>/dev/null
fi
