# .bash_profile

# Load shell dotfiles:
for file in ~/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file
shopt -s histappend;

# Autocorrect typos in path names
shopt -s cdspell;

# bash 4 features
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# tab completion for bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for `defaults read|write NSGlobalDomain`
complete -W "NSGlobalDomain" defaults;

# Complete sudo and man
complete -cf sudo man

# complete ssh hosts
complete -F _known_hosts ssh
 
# complete ping and traceroute
complete -F _known_hosts ping
complete -F _known_hosts traceroute
