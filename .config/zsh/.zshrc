# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8


ZSH_THEME="robbyrussell"

##########################################################################################
#                                 OH MY ZSH PLUGINS
##########################################################################################

plugins=(
  docker
  brew
  aws
  kubectl
  kind
  minikube
	zsh-autosuggestions 
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

###########################################################################################
#                                ALIASES AND ALIASES
#########################################################################################

alias c=clear
alias history="history -E"
alias ls='lsd'

# alias bat='batcat'
alias bt="acpi"
alias al="sudo apt update; sudo apt upgrade -y; brew update; brew upgrade; sudo apt autoremove -y; sudo apt clean; brew cleanup;"
alias cl='sudo apt autoremove -y; sudo apt clean; brew cleanup;'
alias lg="lazygit"

alias r='source ~/.zshrc'
alias n='nvim'

alias air='~/go/bin/air'

# python 
alias python='python3'
alias pip='pip3'

# tmux 
alias t="tmux"
alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"
alias ta="tmux attach -t"
alias tn="tmux new -s"

# git 
alias gs="git status -s"
alias gl='git log --oneline --all --graph'

# notify alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

###########################################################################################

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
export PATH="/home/linuxbrew/.linuxbrew/opt/postgresql@16/bin:$PATH"


######## fd #########
# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# thefuck 
eval $(thefuck --alias)

source ~/fzf-git.sh/fzf-git.sh

# ----- Bat (better cat) -----

