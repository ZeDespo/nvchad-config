# Key bindings and ZSH config variables go here

# Enable colors and change prompt:
autoload -U colors && colors

# Autocomplete custom functions
fpath+="$HOME/.config/zsh/completion"
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
zstyle ':completion:*:*:make:*' tag-order 'targets'

# Auto complete with case insenstivity
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)  # Include hidden files.

# Special case for taskfile completion 
autoload -U _task && compdef _task task


# History in cache directory:
if (( ! EUID  )); then
    HISTFILE=$ZSH_CACHE/history_root
else
    HISTFILE=$ZSH_CACHE/history
fi
HISTSIZE=10000
SAVEHIST=12000
setopt share_history append_history extended_history hist_no_store hist_ignore_all_dups hist_ignore_space

# 2x control is completion from history!!!
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history
bindkey '^X^X' hist-complete

# VI mode
bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char
bindkey "^?" backward-delete-char  # Fix backspace bug when switching modes
autoload -U select-quoted  # ci", ci', ci`, di", etc
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done
autoload -U select-bracketed  # ci{, ci(, ci<, di{, etc
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done
function zle-keymap-select {  # Change cursor shape for different vi modes.
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
echo -ne '\e[5 q'  # Use beam shape cursor on startup.
precmd() { echo -ne '\e[5 q' ;}  # Use beam shape cursor for each new prompt.


# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# In-terminal file explorer
bindkey -s "^g" "lc\n"

# Get recent history
bindkey -s "^h" "history 10\n"

# Clear terminal window
bindkey -s "^l" "clear\n"

# In-terminal file explorer
bindkey -s "^o" "lfcd\n"

