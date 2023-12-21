PROMPT="%(?:%{$fg_bold[cyan]%}%1{󱞩%}:%{$fg_bold[red]%}%1{󱞩%}) %{$fg[cyan]%}%c%{$reset_color%}"
RPROMPT='%*'

PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[denim]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

