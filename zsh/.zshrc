# Source environment variables and auxillary files
source $HOME/.config/zsh/environment.zsh

typeset -ga sources
sources+="/etc/zsh_command_not_found"
sources+="$ZSH_CONFIG/environment.zsh"
sources+="$ZSH_CONFIG/options.zsh"
sources+="$ZSH_CONFIG/aliases.zsh"
sources+="$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"
sources+="$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
sources+="$ZSH_PLUGINS/dirhistory.plugin.zsh"
sources+="$ZSH_PLUGINS/clipboard.zsh"
sources+="$ZSH_PLUGINS/web-search.plugin.zsh"


# Eigen Stuff
sources+="$ZSH_CONFIG/eigen_environment.zsh"
sources+="$ZSH_CONFIG/eigen_aliases.zsh"


foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end


[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
eval source <(/usr/local/bin/starship init zsh --print-full-init)

