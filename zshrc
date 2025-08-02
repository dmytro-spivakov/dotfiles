# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

plugins=(
	git
)
source $ZSH/oh-my-zsh.sh

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
alias gc='git commit'
# ruby
alias be='bundle exec'
alias gcop="git diff --name-only --cached | grep '.rb' | xargs rubocop"

PATH=$PATH:~/go/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
