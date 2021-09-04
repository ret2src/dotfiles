# Increase history size.
export HISTSIZE=9001

# Avoid duplicates in history, remove previous occurrences, and ignore commands starting with a space.
export HISTCONTROL=ignoreboth:erasedups

# Combine multiline commands into one in history.
shopt -s cmdhist

# When the shell exits, append to the history file instead of overwriting it.
shopt -s histappend

# Synchronize shell history after each command.
export PROMPT_COMMAND='history -a ; history -n'

# Add timestamps to history.
export HISTTIMEFORMAT="%F %T "

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set environment variables.
export EDITOR=nvim
export VISUAL=nvim

if [[ $UID -ge 1000 && -d $HOME/.local/bin && -z $(echo $PATH | grep -o $HOME/.local/bin) ]]
then
    export PATH="${PATH}:$HOME/.local/bin"
fi

# Define aliases.
alias l='ll'
alias ll='ls -l'
alias la='ls -al'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
