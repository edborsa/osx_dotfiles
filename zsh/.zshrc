bindkey '^ ' autosuggest-accept
~/.bin/ensure-tmux-is-running

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
    vi-mode
)

alias v=nvim

source $ZSH/oh-my-zsh.sh

. $HOME/.asdf/asdf.sh
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="/opt/homebrew/opt/libxslt/bin:$PATH"
export PATH=$(pyenv root)/shims:$PATH
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
