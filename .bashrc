alias re='source ~/.bashrc'


# French flag colors
BLUE='\[\033[0;34m\]'  # Blue
WHITE='\[\033[0;37m\]' # White
RED='\[\033[0;31m\]'   # Red
RESET='\[\033[0m\]'    # Reset color

# Function to get the current Git branch
git_branch() {
  git branch 2>/dev/null | grep '*' | sed 's/* //'
}

# Set prompt
PS1="${BLUE}\u${BLUE}@${BLUE}\h${WHITE}:${WHITE}\w${RED} $(git_branch) $ ${RESET}"


# Alias to navigate to your dotfile folder
alias dot='cd ~/dotfiles'
alias crv='cd ~/my_projects/cryptorv'

# envs
# alias activ='source ~/.virtualenvs/cryptorv/bin/activate'
alias activ='conda activate cryptorv'
alias base='conda activate base'

# Common aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias cls='clear'

# Git aliases
alias gs='git status'
alias gc='git checkout'
alias gb='git branch'
alias ga='git add'
alias gc='git commit'
alias gp='git pull'
alias gps='git push'
alias gl='git log'
alias glp='git log -p'
alias gls='git log --stat'
alias gd='git diff'
