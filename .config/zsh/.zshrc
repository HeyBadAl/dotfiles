# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  docker
  aws
  kubectl
  minikube
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
alias al="sudo apt update; sudo apt upgrade -y; brew update; brew upgrade"
alias cl='sudo apt autoremove -y; sudo apt clean; brew cleanup;'
alias lg="lazygit"

alias r='source ~/.zshrc'
alias n='nvim'


# tmux alias 
alias t="tmux"
alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"
alias ta="tmux attach -t"
alias tn="tmux new -s"

# git alias for status 
alias gs="git status -s"
alias gl='git log --oneline --all --graph'

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
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/home/linuxbrew/.linuxbrew/opt/postgresql@15/bin:$PATH" 
