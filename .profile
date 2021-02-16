# connor's bash .profile
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi


export PS1="[\[$(tput sgr0)\]\[\033[38;5;9m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\]][\u@\[$(tput sgr0)\]\[\033[38;5;202m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]][\w]: \[$(tput sgr0)\]"
export PATH=$PATH:~/bin

alias rm='rm -i' #Require confirmation to delete stuff. can overide w/ -f
alias cp='cp -iv' #Confirm for overwrite + more verbosity
alias mkdir='mkdir -pv' #Makes any preceeding folders if needed + more verbosity


#Quicker navigation
alias editBashProfile='vim ~/.profile' # open .bash_profile in editor
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels

#--------------START EDDIE3 & EDINBURGH specific --------------
alias eddie=ssh <USERNAME>@eddie3.ecdf.ed.ac.uk
alias sftp-eddie=sftp <USERNAME>@eddie3.ecdf.ed.ac.uk

