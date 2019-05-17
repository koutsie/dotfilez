
#
# ~/.bashrc
#
[[ $- != *i* ]] && return
export HISTCONTROL=ignoreboth:erasedups
if [ -d "$HOME/.bin" ] ;
	then PATH="$HOME/.bin:$PATH"
fi
if [ -f ~/.bashrc_aliases ]; then
. ~/.bashrc_aliases
fi
bash .bashrc_user
