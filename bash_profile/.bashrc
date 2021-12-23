# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

##########################################
# Color Codes ..... Edited on Feb 3, 2020
BGREEN='\[\e[1;32m\]'
BYELLOW='\[\e[1;33m\]'
NOCOLOR='\[\e[1;00m\]'
BLINK='\[\e[5m\]'
NORMAL='\[\e[25m\]'
BNOCOLOR='\[\e[1m\]'
BBLUE='\[\e[1;94m\]'
BMAGENTA='\[\e[1;35m\]'
#####################################



if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1="${BGREEN}┌─ ${BMAGENTA}[♋${NORMAL} \h ]𝄩 ${BGREEN}[♎ \u ]𝄩 ${BBLUE}[♓ \w ]${BGREEN}ᘓ [git: \$(git branch 2>/dev/null | grep '^*')]\n└─╼ ${NOCOLOR}${BNOCOLOR}"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt



# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Extra Gimmicks ............ 

echo -e "\e[1;32mWelcome $USER ....... .....! \e[1;34m"
date | cut -d ' ' -f 1-6
echo -en "\e[1;35m \e[5m▶ \e[25m"
uptime -p | cut -d ' ' -f 2-
# Weather report. Docu: https://github.com/chubin/wttr.in
curl wttr.in/<location>?format="tmp:%c+%t-feel:%f+%m\n"
echo -e "\e[0m"

export PATH="$HOME/bin:$PATH"

