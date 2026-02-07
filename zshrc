# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
plugins=(
)
source $ZSH/oh-my-zsh.sh

# prompt
eval "$(starship init zsh)"

# edit current command in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

export EDITOR=nvim

# lang-specific setup
# ruby
eval "$(rbenv init - zsh)"

# aliases
# git
alias g='git'
alias ga='git add'
alias gc='git checkout'

# Smart commit widget
smart-commit() {
  local branch=$(git branch --show-current 2>/dev/null)
  
  if [[ -z "$branch" ]]; then
    BUFFER="g commit -m ''"
    CURSOR=$((${#BUFFER} - 1))
    return
  fi
  
  local prefix=""
  if [[ "$branch" != "main" && "$branch" != "master" ]]; then
    prefix="${branch}: "
  fi
  
  BUFFER="g commit -m '${prefix}'"
  CURSOR=$((${#BUFFER} - 1))  # Position cursor before closing quote
}

# Register as a widget
zle -N smart-commit

# Bind to a key combination (Ctrl+G in this example)
bindkey '^G' smart-commit

# ruby
alias be='bundle exec'
alias gcop="git diff --name-only --cached | grep '.rb' | xargs rubocop"

# python
# alias python="python3"
# alias pip="pip3"
export PATH=$HOME/.local/bin:$PATH

PATH=$PATH:~/go/bin

# add Postgres.app bins to path
PATH=$PATH:/Applications/Postgres.app/Contents/Versions/17/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rust
. "$HOME/.cargo/env"

