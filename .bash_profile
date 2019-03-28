# user_profile
#
# Add the following to your .bash_profile:
#
# source $HOME/dotfiles/.bash_profile

source /etc/bashrc

set -o vi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export HISTFILESIZE=-1
export HISTSIZE=1000000
export HISTCONTROL=ignoredups
shopt -s histappend
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export EDITOR=vim

# gpg
export GPG_TTY=$(tty)

# SHELL COMPLETION
# git
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
source $HOME/dotfiles/git-completion.bash

# PROMPT
# git
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source $HOME/dotfiles/git-prompt.sh
# Dracula theme colors https://draculatheme.com
export PS1='\u@\h 🚀 \[\e[0;36m\]\[\e[0;36m\] \W\[\033[0;35m\]$(__git_ps1 " (%s)")\[\e[0m\]: '

# aliases
# weather and the moon
alias weather='curl -4 http://wttr.in/'
alias moon='curl -4 http://wttr.in/Moon'

alias g=git
# github
if [ -x "$(command -v hub)" ]; then
  alias git=hub
fi

# Revert a file to its original version
alias hgrevert='hg revert -r .~1'

# `ls` colors
alias ls='ls -GFh'
alias lsl='ls -aGFhl'
alias lsa='ls -aGFh'

alias grep='grep --color'

if [ -x "$(command -v vim)" ]; then
  alias vi=vim
fi

# https://github.com/sharkdp/bat
if [ -x "$(command -v bat)" ]; then
  alias cat=bat
fi

# source control
# Display local branches, sorted by creation date.
alias gitbranchdate='for k in `git branch | perl -pe s/^..//`; do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k -- | head -n 1`\\t$k; done | sort -r'
# A last resort to get your local checkout back in track
alias hgreset='hg update --clean -r .; hg revert --all; hg purge --files; hg purge --all; hg gc; hg checkout master --clean; arc pull'


# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# z
. /usr/local/etc/profile.d/z.sh
