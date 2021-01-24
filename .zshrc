# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
    battery
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    fzf-tab
    zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#
export EDITOR='vim'
export TERM='xterm-kitty'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
alias w10="sudo mount.ntfs /dev/sda4 /windows10"
alias zconf="vim ~/.zshrc"
alias vconf="vim ~/.vimrc"
alias bar="vim ~/.config/polybar/config.ini"
alias i3conf="vim ~/.config/i3/config"
alias kittyconf="vim ~/.config/kitty/kitty.conf"
alias lightdmconf="sudo nvim /etc/lightdm/lightdm-webkit2-greeter.conf"
alias lightdmwebkitconf="sudo nvim /usr/share/lightdm-webkit/themes"
alias play="mocp"
alias yt="youtube-dl -f 'best[height<=720]+bestaudio' "
alias stata="wine /home/stanoo/Downloads/Stata-MP-16.0/StataMP-64.exe & disown"

#kitty completions
autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

# Import colorscheme from 'wpg' asynchronously
(cat $HOME/.config/wpg/sequences &)

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

#Set command to extract different file archives
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# My custom aliases
alias oh='fuck'

# Functions
function m() {
python3 -c print("$1")
}
alias rm='rm -i'

#Set your environment path
export PATH=/home/stanoo/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

alias dots='/usr/bin/git --git-dir=/home/stanoo/.dots/ --work-tree=/home/stanoo'
alias config="/usr/bin/git --git-dir=$HOME/Projects/dotfiles/ --work-tree=$HOME"
#source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
