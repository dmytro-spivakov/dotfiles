# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

export EDITOR=nvim

# lang-specific setup
# ruby
# eval "$(rbenv init - zsh)"

# add go to path
export PATH=$PATH:/usr/local/go/bin

export BAT_THEME="GitHub"

# aliases
alias wise_magic_cow='fortune | cowsay | lolcat'

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

# Starship prompt
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"

# uv bullshit, TODO: use INSTALLER_NO_MODIFY_PATH
# . "$HOME/.local/share/../bin/env"
