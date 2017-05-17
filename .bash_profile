echo Executing .bash_profile...

# Alias
# alias la='ls -la'
alias ls="ls -G"
alias l="ls -1A"
alias la="ls -lh -A"
alias ll="ls -lh"

# git
alias glo="git log --pretty=oneline"
alias gls="git log --pretty=oneline --stat"

# Required for color schemes
export DISPLAY=xterm-256color

# Shell colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Fix git if Xcode Command Line Tools are not installed
# alias git='xcrun git'

# Git in command prompt
# PS1='\w`__git_ps1`\$ '
function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}
# Cyan:       \[\033[1;36m\]
# Black bold: \[\033[1;30m\]
# Black:      \[\033[0;30m\]
PS1="\[\033[1;36m\]\w \[\033[1;30m\]\$(parse_git_branch)\[\033[0;30m\]\$ "

# Load .git-completion.sh
source ~/.git-completion.sh

# Set up nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Set default nvm to lts
nvm alias default lts/boron
nvm use default

# Set yarn path (Not sure I need to do this
#export PATH="$PATH:`yarn global bin`"

# RVM set up
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

# Push to Maginatics /reviews
# alias pushgerrit='git push origin HEAD:refs/for/master'

# Android SDK
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
#PATH=$PATH:$HOME/dev/android-sdk-macosx/tools
#PATH=$PATH:$HOME/dev/android-sdk-macosx/platform-tools

# Android environment variables
#export SDK_ROOT=/Users/kurt/dev/android-sdk-macosx/
#export ANDROID_HOME=/Users/kurt/dev/android-sdk-macosx/
#export ANDROID_NDK_HOME=/Users/kurt/dev/android-ndk-r8d/

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# Setting PATH for JRuby 1.7.3
# The orginal version is saved in .bash_profile.jrubysave
#PATH="${PATH}:/Library/Frameworks/JRuby.framework/Versions/Current/bin"
#export PATH

# Setting PATH for Maginatics Troll mgt_console project
#export RAILS_ENV=development

# Set go path
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=/Users/kurt/dev/tars/:$(go env GOPATH)

# Python: pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# Set mongodb path
export PATH=$PATH:~/mongodb/bin

# Borrowed from Craig Hockenberry http://furbo.org/2014/09/03/the-terminal/
alias con="tail -40 -f /var/log/system.log"
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
export EDITOR="vi"

