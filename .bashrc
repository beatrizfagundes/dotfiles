
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Prompt with Git branch
# Explanation of the weird lines: \u Username, \h Host, \w Path, tput setaf is the color definition
# export PS1='\[$(tput setaf 7)\]\u@\[$(tput setaf 5)\]\h:\[$(tput setaf 6)\]\W\[$(tput setaf 1)\]$(parse_git_branch)\[$(tput sgr0)\] $ '
# host_modified='MacBook-Pro'
# export PS1='\[$(tput setaf 5)\]\u@\[$(tput setaf 3)\]${host_modified}:\[$(tput setaf 6)\]\W\[$(tput setaf 2)\]$(parse_git_branch)\[$(tput sgr0)\] $ '
export PS1='\[$(tput setaf 5)\]\u:\[$(tput setaf 6)\]\W\[$(tput setaf 2)\]$(parse_git_branch)\[$(tput sgr0)\] $ '
