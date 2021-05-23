#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export LC_ALL="en_US.UTF-8"
alias dl="youtube-dl -x -o '%(title)s.%(ext)s' --add-metadata"
