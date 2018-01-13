zstyle ':completion:*' use-cache on

source "$(brew --prefix)/share/antigen/antigen.zsh"
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

# bindkey "^[^[[C" forward-word
# bindkey "^[^[[D" backward-word

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  #Guess what to install when running an unknown command.
  command-not-found

  #Bundles from default repo
  git
  heroku
  pip
  per-directory-history

  #Postgres helper utilities
  caarlos0/zsh-pg

  #Syntax highlighting on the command line
  zsh-users/zsh-syntax-highlighting

  # generate zsh completions using gencomp <command>
  RobSis/zsh-completion-generator

  # npm run ... autocompletion
  akoenig/npm-run.plugin.zsh
EOBUNDLES

# Load the theme.
antigen theme $ZSH_THEME

# Tell antigen that you're done.
antigen apply

export DOTFILES=~/.dotfiles

# Source all files in "source"
function src() {
  local file
  if [[ "$1" ]]; then
    source "$DOTFILES/source/$1.sh"
  else
    for file in $DOTFILES/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

src
