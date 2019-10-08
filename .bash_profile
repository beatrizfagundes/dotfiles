export LC_ALL=en_US.UTF-8
# Fixing Maven problem
# export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=/usr/local/bin:$PATH
# Setting PATH for Python 2.7
# export PYTHONPATH=/usr/local/lib/python2.7/site-packages/
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# export PATH
alias python=python3

alias ll="ls -alF"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source ~/.profile

# Customize terminal

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Colors for the prompt
blue="\033[0;34m"
white="\033[0;37m"
green="\033[0;32m"

# Brackets needed around non-printable characters in PS1
ps1_blue='\['"$blue"'\]'
ps1_green='\['"$green"'\]'
ps1_white='\['"$white"'\]'

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# I like tunning the colors of the prompt in the first place:
export CLICOLOR='true'
export LSCOLORS="gxfxcxdxbxCgCdabagacad"
export EDITOR=vi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Git branch in good-looking prompt.
parse_git_branch() {
    gitstatus=`git status 2> /dev/null`
    if [[ `echo $gitstatus | grep "Changes to be committed"` != "" ]]
    then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1***)/'
    elif [[ `echo $gitstatus | grep "Changes not staged for commit"` != "" ]]
    then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1**)/'
    elif [[ `echo $gitstatus | grep "Untracked"` != "" ]]
    then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1*)/'
    elif [[ `echo $gitstatus | grep "nothing to commit"` != "" ]]
    then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    else
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1?)/'
    fi
}

# Echo a non-printing color character depending on whether or not the current git branch is the master
# Does NOT print the branch name
# Use the parse_git_branch() function for that.
parse_git_branch_color() {
    br=$(parse_git_branch)
    if [[ $br == "(master)" || $br == "(master*)" || $br == "(master**)" || $br == "(master***)" ]]; then
        echo -e "${blue}"
    else
        echo -e "${green}"
    fi
}

# Increase ctrl-r history size
export HISTFILESIZE=1000000
export HISTSIZE=1000000
