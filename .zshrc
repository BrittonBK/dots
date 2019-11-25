#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$HOME/dev/bin"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/dev/bin:$PATH"
export VAGRANT_DEFAULT_PROVIDER=virtualbox
export VISUAL=vim
export EDITOR=vim

# Load aliases
source $HOME/.aliases

autoload -Uz promptinit
promptinit
prompt agnoster
export AGNOSTER_PROMPT_SEGMENTS[2]=

# setup pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export LSCOLORS='ExfxcxdxbxGxDxabagacad'
