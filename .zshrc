## SET UP ZINIT ##

# Set the directory we want to store Zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add zsh plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# Use zsh completion system
autoload -U compinit && compinit -u

# Load completions
zinit cdreplay -q


# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::thefuck
zinit snippet OMZP::command-not-found
#zinit snippet OMZP::globalias
# Only use globalias for git plugin???


## DEFAULT CONFIGURATION ##

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups

# Source separate file with completion stuff
source ~/.zsh_completion

# Aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

## OTHER SOURCES ##

# Load OMP prompt theme
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/catppuccin_mocha.toml)"

# Set up fzf key bindings and fuzzy completion
#source <(fzf --zsh)
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# Attempt to complete aliases
#unsetopt completealiases

export XDG_CONFIG_HOME=~/.config

export PATH="$PATH:/opt/nvim-linux64/bin"

export NVM_DIR="$HOME/.config//nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

