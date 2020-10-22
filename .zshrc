# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load the powerlevel10k theme :)
source "$HOME/powerlevel10k/powerlevel10k.zsh-theme"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# -r = if file exist and is readable by the current process
# <.> will do the same trick as <source>
CONFIG_FOLDER="$HOME/.my-configs"
if [[ -r "$CONFIG_FOLDER/.aliasrc" ]]; then . "$CONFIG_FOLDER/.aliasrc"; fi
if [[ -r "$CONFIG_FOLDER/.keybindsrc" ]]; then . "$CONFIG_FOLDER/.keybindsrc"; fi
if [[ -r "$CONFIG_FOLDER/.variables" ]]; then . "$CONFIG_FOLDER/.variables"; fi

# Suggest download for packages not found
source "/etc/zsh_command_not_found"

# Load nvm :)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Highlighting
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/steve/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/steve/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/steve/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/steve/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<