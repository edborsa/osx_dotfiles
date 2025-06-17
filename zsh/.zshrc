export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
	)

source $ZSH/oh-my-zsh.sh

export PATH="/Users/eduardoborsa/.local/bin:$PATH"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
autoload -Uz compinit && compinit

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="/Users/eduardoborsa/.codeium/windsurf/bin:$PATH"
export PATH="/Users/eduardoborsa/programs/bin:$PATH"
export PATH="/Users/eduardoborsa/.local/share/nvim/mason/bin:$PATH"
export PATH="/Users//eduardoborsa/.local/bin:$PATH"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


eval "$(direnv hook zsh)"
