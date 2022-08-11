#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ ' #normal
#PS1='[\u] \t \n  \w/ \n$ ' #custom 1
#PS1='\n\[\033[01;32m\][\u] \[\033[01;31m\]\t \n  \[\033[01;34m\]\w/ \n\[\033[01;37m\]$ ' # white ending
#PS1='\n\[\033[01;32m\][\u] \[\033[01;33m\]\t \n  \[\033[01;34m\]\w/ \n\[\033[00m\]$ ' # normal ending
#PS1='\n\[\033[41m\]\[\033[37m\][\u]\[\033[00m\] \[\033[01;33m\]\A \n  \[\033[01;34m\]\w/ \n\[\033[01;37m\]$\[\033[00m\] ' # normal ending
#PS1='\n\[\033[41m\]\[\033[37m\][\u]\[\033[00m\] \[\033[01;33m\]\A \n  \[\033[01;34m\]\w/ \n\[\033[01;37m\]$\[\033[01;32m\] ' # green text
PS1='\n\[\033[41m\]\[\033[37m\][\u]\[\033[00m\] \[\033[01;34m\]\w \n\[\033[01;32m\]\t\[\033[01;37m\] $\[\033[00m\] ' # normal 2line
# PATH
export PATH=$PATH:/home/arch-user/.local/bin

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#export QT_QPA_PLATFORMTHEME="qt5ct"

export TERM="xterm-256color"                      # getting proper colors

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

## Aliases ##
alias bcfg='nano ~/.bashrc'
alias rbash='source ~/.bashrc'
alias rxt='xrdb ~/.Xresources'

# get window class ID
#alias xprop='xprop'
alias l='ls'
#alias ll='ls -lah'
alias klk='sudo kloak'
alias openports='netstat -nape --inet'

alias spotdl='~/.local/bin/spotdl'

alias pipupdate='pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U'
alias dmenu='dmenu_run -l 20 -nb black -nf green -sb blue -sf black'
alias q1='cd /mnt/veracrypt1'
alias q2='cd /mnt/veracrypt2'
# alias crontab='EDITOR=nano crontab -e'
alias sys='sudo systemctl'
alias pupdate='sudo pacman -Syu'
alias pfullupdate='sudo pacman -Syyu'
alias pinstall='sudo pacman -S'
alias premove='sudo pacman -Rns'
alias psearch='sudo pacman -Ss'
alias pcleanup='sudo pacman -Rns (pacman -Qtdq)'
alias yupdate='yay -Sua'
alias spotplay='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause'
alias spotpause='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause'
alias spotnext='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next'
alias spotprev='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous'
alias spotstop='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop'
alias gc='git clone'
alias duu='du -sh */'
alias autostart='nano .bashrc'
alias youtube='youtube-dl'
alias mpcplay='mpc play && mpDris2 &'
#alias lm='ls | more"
alias py='python'
alias chmodx='chmod +x'
alias rofi='rofi -show run'
alias p='pwd'
## My Directories ##

alias awe='cd ~/.config/awesome'
alias awes='cd ~/.config/awesome/themes/supertheme'
alias prog='cd ~/programming'
alias jerms='cd ~/programming/jerms'
alias pydir='cd ~/programming/python'
alias web='cd ~/programming/webdev'
alias scrip='cd ~/scripts'
alias server='cd ~/servers'


## My Programs ##
alias jcalc='cd ~/scripts && ./jcalc-cli.sh'
alias jcalc='cd ~/scripts && ./jermbytes.sh'

##  GPG  ##

alias gpg-v='gpg --verify-options show-notations --verify'
alias gpg-i='gpg --key-id-format long --import --import-options show-only --with-fingerprint'
alias gpg-r='gpg --recv-keys'

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Changing "ls" to "exa"
alias l='exa  -l --color=always --group-directories-first' # my preferred listing
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -al --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"
# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias rmd='rm -rf -i'
# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#pfetch
neofetch
export EDITOR=nano
# export QT_QPA_PLATFORMTHEME="qt5ct" (put this in .bash_profile)

mpd ~/.config/mpd/mpd.conf
# playerctld daemon

