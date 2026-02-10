#################################
## Shell                       ##
#################################

export PATH="/opt/homebrew/bin:$PATH"
export DOTFILES=~/.dotfiles-macos

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# Prompt customization
if [[ $TERMINAL_EMULATOR == "JetBrains-JediTerm" ]]; then
 [[ ! -f $DOTFILES/zsh/.p10k-intellij.zsh ]] || source $DOTFILES/zsh/.p10k-intellij.zsh
else
 [[ ! -f $DOTFILES/zsh/.p10k-ghostty.zsh ]] || source $DOTFILES/zsh/.p10k-ghostty.zsh
fi

# Autocomplete & Autojump
setopt interactive_comments
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

#################################
## General Env & Aliases       ##
#################################

alias update-env='cd ~/.dotfiles-macos && export DOTFILES=~/.dotfiles-macos && python3 install.py'

# 1Password SSH Agent
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Source secrets if they exist
[ -f ~/.zshpasswords ] && source ~/.zshpasswords

#################################
## .NET Setup                  ##
#################################

export PATH="$PATH:$HOME/.dotnet/tools"
export DOTNET_CLI_TELEMETRY_OPTOUT=1

alias dr='dotnet run'
alias db='dotnet build'
alias dt='dotnet test'
alias dw='dotnet watch'

# Global bins
export PATH="$HOME/bin:/usr/local/bin:$PATH"