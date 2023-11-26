# Aliases go here

# Neovim gang
export EDITOR="nvim"
alias vi="nvim"
alias vim="nvim"
alias nv="nvim"

# Base overwrite commands
alias ls="lsd --extensionsort --versionsort"

# A good looking diff
alias diff-sf="diff-so-fancy"

# Easy configuration editing
alias zsource="source ${HOME}/.zshrc"
alias aliasedit="$EDITOR ${ZSH_CONFIG}/aliases.zsh"
alias zshedit="$EDITOR ${HOME}/.zshrc"

# Easy copying and pasting
alias copy="clipcopy"
alias paste="clippaste"

# The F*ck, auto-command fixer
eval $(thefuck --alias)
alias f="fuck"

# Youtube-DL

function ydla() {
    output="${HOME}/d/Music/Youtube/"
    cd $output && \
        yt-dlp \
            --retries infinite \
	    --verbose \
            --extract-audio \
            --audio-format m4a \
            --audio-quality 0 \
            --embed-thumbnail \
            --output "%(title)s.%(ext)s" \
            -4 \
            --download-archive "$output/.youtube-dl.txt" \
            $1
}
