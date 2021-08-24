# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.composer/vendor/bin:$PATH

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/matthewnelson/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

# nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# enable command auto-correction.
#ENABLE_CORRECTION="true"
# don't correct command line arguments
setopt nocorrectall
# do correct commands
setopt correct

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="%d %b  %I:%M %p"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(laravel npm)

source $ZSH/oh-my-zsh.sh

# User configuration

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

export EDITOR='vim'

export TERM=xterm-256color

# vi mode stuff

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey "^?" backward-delete-char

# tags to display when in particular mode
#
vim_ins_mode="%{$fg[cyan]%}[INSERT]%{$reset_color%}"
vim_cmd_mode="%{$fg[magenta]%}[NORMAL]%{$reset_color%}"
#begin script to toggle these tags depending on mode
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}
# end script (thanks to http://pawelgoscicki.com/archives/2012/09/vi-mode-indicator-in-zsh-prompt/)

# actually place the tag on the screen
RPROMPT='${vim_mode}'

# speed up change from insert to normal mode, but keep long enough so keystroke sequences recognized
export KEYTIMEOUT=15

#export LS_COLORS="di=1;37:*.gitignore=33"
export TREE_COLORS="di=1;34:"

# Directory Aliases
alias desk="~/Desktop"
alias dev="~/Desktop/Dev"
alias reactdev="~/Desktop/Dev/react"
alias vuedev="~/Desktop/Dev/vue"
alias elmdev="~/Desktop/Dev/elm"
alias jsdev="~/Desktop/Dev/js"
alias dotfiles="~/.dotfiles"
alias exer="/Users/matthewnelson/Exercism"

# Application-Specific Aliases
alias pu="./vendor/bin/phpunit"
alias puf="./vendor/bin/phpunit --filter"
alias pug="./vendor/bin/phpunit --group"
alias sqlstart="/Applications/MAMP/bin/startMysql.sh"
alias sqlstop="/Applications/MAMP/bin/stopMysql.sh"
alias serverstart="/Applications/MAMP/bin/start.sh"
alias serverstop="/Applications/MAMP/bin/stop.sh"
alias mysql="/Applications/MAMP/Library/bin/mysql -u root -p"
alias jest="npx jest --maxWorkers=50%"
alias dev="npm run dev"
alias prod="npm run prod"
alias pat="php artisan test"
alias patp="php artisan test --parallel"

# General Command Line Aliases
alias zshrc="vim /Users/matthewnelson/.zshrc"
alias tree="tree -I 'node_modules|vendor|storage|cache|haskell-ide-engine'"
alias t1="tree -tL 1"
alias t1a="tree -atL 1"
alias t2="tree -tL 2 -I 'node_modules|vendor|storage|cache|haskell-ide-engine'"
alias t2a="tree -atL 2"
alias t3="tree -tL 3 -I 'node_modules|vendor|storage|cache|haskell-ide-engine'"
alias lsl="ls -al"
alias l="ls -AFGu"

alias rm="trash"
alias del="trash"

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
ZSH_DISABLE_COMPFIX=true
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
if [ -e /Users/matthewnelson/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/matthewnelson/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# hook direnv to shell, used by ihp (haskell web framework)
eval "$(direnv hook zsh)"
