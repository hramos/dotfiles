## Setup Script

Some of my machines mess directly with .bash_profile, so I do the same and source my own user_profile script.

```
git clone https://github.com/hramos/dotfiles.git $HOME/dotfiles/
touch $HOME/.bash_profile
echo "source $HOME/dotfiles/user_profile" >> $HOME/.bash_profile
```
