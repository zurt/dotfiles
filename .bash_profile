echo Executing bash_profile...

# Alias
# alias la='ls -la'
alias ls="ls -G"
alias l="ls -1A"
alias la="ls -lh -A"
alias ll="ls -lh"

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
PS1="\w \$(parse_git_branch)\$ "

# Load .git-completion.sh
source ~/.git-completion.sh

# RVM set up
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

# Push to Maginatics /reviews
# alias pushgerrit='git push origin HEAD:refs/for/master'

# Android SDK
PATH=$PATH:$HOME/dev/android-sdk-macosx/tools
PATH=$PATH:$HOME/dev/android-sdk-macosx/platform-tools

# Android environment variables
export SDK_ROOT=/Users/kurt/dev/android-sdk-macosx/
export ANDROID_HOME=/Users/kurt/dev/android-sdk-macosx/
export ANDROID_NDK_HOME=/Users/kurt/dev/android-ndk-r8d/

# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# Setting PATH for JRuby 1.7.3
# The orginal version is saved in .bash_profile.jrubysave
PATH="${PATH}:/Library/Frameworks/JRuby.framework/Versions/Current/bin"
export PATH

# Setting PATH for Maginatics Troll mgt_console project
export RAILS_ENV=development
