export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	zsh-autosuggestions 
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
alias c=clear
alias history="history -E"
alias ls='lsd'

alias bat='batcat'
alias bt="acpi"
alias al="sudo apt update; sudo apt upgrade -y"
alias lg="lazygit"

alias r='source ~/.zshrc'
alias n='nvim'


# tmux alias 
alias t="tmux"
alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"
alias ta="tmux attach -t"
alias tn="tmux new -s"



autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

export PATH=$PATH:/usr/local/go/bin

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# HISTSIZE and no command repetition 
HISTSIZE=4000
if [[ -n "$TMUX" ]]; then
    setopt HIST_IGNORE_DUPS
    setopt HIST_IGNORE_ALL_DUPS
    setopt HIST_IGNORE_SPACE
else
    setopt HIST_IGNORE_DUPS
    setopt HIST_IGNORE_ALL_DUPS
    setopt HIST_IGNORE_SPACE
fi

# fzf 
source /usr/share/doc/fzf/examples/key-bindings.zsh

# starship 
# eval "$(starship init zsh)"
#
