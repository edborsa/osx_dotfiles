. "$HOME/.asdf/asdf.sh"
# bindkey '^ ' autosuggest-accept
# ~/.local/bin/ensure-tmux-is-running

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# . $HOME/.asdf/asdf.sh
# export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
# export PATH="/opt/homebrew/opt/libxslt/bin:$PATH"
# PATH=$(pyenv root)/shims:$PATH
# export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/home/dado/.local/bin:$PATH"
export PATH="/home/dado/programs:$PATH"
