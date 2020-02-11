
#
# ~/.bashrc
#

export LS_COLORS='di=1;37:ln=30;44:so=32:pi=33:ex=1;31;1;47:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export PS1='\[$(tput sgr0)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;160m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\][\[$(tput sgr0)\]\[\033[38;5;202m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]:[\[$(tput sgr0)\]\[\033[38;5;221m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\]] \[$(tput sgr0)\]\[\033[38;5;226m\]:\[$(tput sgr0) \]'


OPENCV_LOG_LEVEL=ERROR
[[ $- != *i* ]] && return
export HISTCONTROL=ignoreboth:erasedups
if [ -d "$HOME/.bin" ] ;
	then PATH="$HOME/.bin:$PATH"
fi

if [ -f ~/.bashrc_aliases ]; then
. ~/.bashrc_aliases
fi

bash .bashrc_user


# alias freeso="sh "env WINEPREFIX="/home/koutsie/.wine" wine C:\\windows\\command\\start.exe /Unix /home/koutsie/.wine/dosdevices/c:/ProgramData/Microsoft/Windows/Start\ Menu/Programs/FreeSO\ Launcher.lnk""

