#################################
## Shell                       ##
#################################

# Make sure Homebrew is in path
export PATH="/opt/homebrew/bin:$PATH"

# Point to .dotfiles-macos repo
export DOTFILES=~/.dotfiles-macos

# Prepend homebrew to path
export PATH="/opt/homebrew/bin:$PATH"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

if [[ $TERMINAL_EMULATOR == "JetBrains-JediTerm" ]]; then
 [[ ! -f $DOTFILES/zsh/.p10k-intellij.zsh ]] || source $DOTFILES/zsh/.p10k-intellij.zsh
else
 [[ ! -f $DOTFILES/zsh/.p10k-ghostty.zsh ]] || source $DOTFILES/zsh/.p10k-ghostty.zsh
fi

# The next block (interactive and source) is to make zsh-autocomplete to work
setopt interactive_comments # weird fix for autocomplete
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

############
# Homebrew #
############

export PATH="$(brew --prefix)/bin:$PATH"

# Allow comments in scripts
# Makes hash char a signal for comments in scripts
setopt interactivecomments

#################################
## Jenv			       ##
#################################
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/usr/local/sbin:$PATH"

if which jenv > /dev/null; then eval "$(jenv init -)"; fi

#################################
## Work apps setup             ##
#################################

# Intellij
export PATH="/Applications/IntelliJ IDEA.app/Contents/bin:$PATH"

# Automatic update environment
alias update-env='cd ~/.dotfiles-macos && export DOTFILES=~/.dotfiles-macos && python3 install.py'

export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
