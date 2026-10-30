# Created by newuser for 5.9
fastfetch

export PATH="$HOME/.local/bin:$PATH"

# remove file from home
export LESSHISTFILE=-

# yazi snippet, move location to last directory before close
function y() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}
