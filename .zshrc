# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History config
export HISTSIZE=10000
if [[ ! -r "$CONFIG_FOLDER/.history" ]]; then touch "$CONFIG_FOLDER/.history"; fi
export HISTFILE="$CONFIG_FOLDER/.history"
export SAVEHIST="$HISTSIZE"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then PATH="$HOME/bin:$PATH"; fi
# Add julia bin folder to path  
if [ -d "$PATH:$HOME/julia-1.5.3/bin" ] ; then PATH="$PATH:$HOME/julia-1.5.3/bin"; fi

# -r = if file exist and is readable by the current process
# <.> will do the same trick as <source>
CONFIG_FOLDER="$HOME/.my-configs"
if [[ -r "$CONFIG_FOLDER/.aliasrc" ]]; then . "$CONFIG_FOLDER/.aliasrc"; fi
if [[ -r "$CONFIG_FOLDER/.keybindsrc" ]]; then . "$CONFIG_FOLDER/.keybindsrc"; fi
if [[ -r "$CONFIG_FOLDER/.variables" ]]; then . "$CONFIG_FOLDER/.variables"; fi
if [[ -r "$CONFIG_FOLDER/powerlevel10k/powerlevel10k.zsh-theme" ]]; then 
  . "$CONFIG_FOLDER/powerlevel10k/powerlevel10k.zsh-theme"; 
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $CONFIG_FOLDER/.p10k.zsh ]] || source $CONFIG_FOLDER/.p10k.zsh

# Initialize conda
if [[ -r "$CONFIG_FOLDER/.conda-setup" ]]; then . "$CONFIG_FOLDER/.conda-setup"; fi

# Load nvm :)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Make tab completion non case sensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Highlighting
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.zsh/zsh-256color/zsh-256color.plugin.zsh"
# source "$HOME/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# Suggest download for packages not found
source "/etc/zsh_command_not_found"