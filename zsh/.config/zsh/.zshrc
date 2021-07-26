# Instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey -v
export EDITOR='nvim'

export PATH=$HOME/bin:/usr/local/bin/:$PATH
export PATH=/usr/local/opt/llvm/bin:$PATH
export PATH=$HOME/.config/scripts:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.poetry/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

[ -f $HOME/.config/zsh/omz_vars ] && source $HOME/.config/zsh/omz_vars
[ -f $HOME/.config/zsh/aliasrc ] && source $HOME/.config/zsh/aliasrc
[ -f $HOME/.config/zsh/conda ] && source $HOME/.config/zsh/conda
[ -f $HOME/.config/zsh-work/nsalias ] && source $HOME/.config/zsh-work/nsalias

# zsh-autosuggestions
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# omz plugins
plugins=(git osx last-working-dir zsh-syntax-highlighting vi-mode)
eval $(thefuck --alias please)

export RPS1="%{$reset_color%}"
source $ZSH/oh-my-zsh.sh

ctags=/usr/local/bin/ctags

unsetopt nomatch # disable annoying nomatch found error

# pyenv
eval "$(pyenv init -)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='fd --type file --color=always --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

