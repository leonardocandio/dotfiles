# ~/.zshrc
# zsh-unplugged
# where do you want to store your plugins?
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# make list of the Zsh plugins you use
plugins=(
  sindresorhus/pure
  zsh-users/zsh-completions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions
  romkatv/zsh-defer
  zdharma-continuum/fast-syntax-highlighting
)

# now load your plugins
plugin-load $plugins

#Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Aliases
alias ls='ls --color -a'
alias vim='nvim'
alias c='clear'
alias lg='lazygit'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
#Adding ~/scripts to path
export PATH="$HOME/scripts:$PATH"

# Yazi y wrapper
