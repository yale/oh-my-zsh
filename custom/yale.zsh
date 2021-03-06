alias code=$HOME/Sites

# Project directories and servers
function imd {
  cd ~/Sites/imedidata
  gst
}

function imdserver {
  imd
  ./script/server
}

function authmedidata {
  cd ~/Sites/authmedidata
  rails server
}

function jazzhands {
  cd ~/Sites/jazzhands
  rvm 1.8.7-p302@jazzhands
  gst
  rails server --port 4000
}

# grep for a process
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# A Better Rsynched Based SCP
alias scrp="rsync --partial --progress --rsh=ssh"

# extract anything
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# kill anything like a keyword
function k {
  if [ ! -z $* ] ; then
    PRE='/\/bin\/'
    POST='/{/grep/!p;}'
    SEDARG=$PRE$*$POST
    ps aux | sed -n $SEDARG | awk '{print$2}' | xargs kill -9
  else
    echo "I'm afraid I can't do that without a process name to match, Dave"
  fi
}

alias bex='bundle exec'
alias omz='vim ~/.homesick/repos/yales-castle/home/.oh-my-zsh/'
alias vimfiles='cd ~/Sites/vim-files/'
alias nodeboilerplate='git clone git://github.com/robrighter/node-boilerplate.git'
alias octave='exec /Applications/Octave.app/Contents/Resources/bin/octave'
alias git='nocorrect git'
alias aliases='vim ~/.homesick/repos/yales-castle/home/.oh-my-zsh/custom/yale.zsh'
alias site5='ssh yalespec@yalespector.com'
alias hspull='homesick pull yales-castle'
alias castle='cd ~/.homesick/repos/yales-castle/'
