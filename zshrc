export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=~/.npm-global/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export HOSTNAME=localhost
export ZSH="$HOME/.oh-my-zsh"

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
plugins=(npm)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export EDITOR='vim'

export TERM=xterm-256color

# vi mode stuff

bindkey -v
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
alias dotfiles="~/.dotfiles"

# Application-Specific Aliases
alias pu="./vendor/bin/phpunit"
alias puf="./vendor/bin/phpunit --filter"
alias pug="./vendor/bin/phpunit --group"
alias jest="npx jest --maxWorkers=50%"
alias dev="npm run dev"
alias prod="npm run prod"
alias pat="php artisan test"
alias patp="php artisan test --parallel"
alias curlprod='curl -H "Authorization: $(squint bearer --prod)"'
alias curldev='curl -H "Authorization: $(squint bearer --dev)"'

# General Command Line Aliases
alias zshrc="vim $HOME/.zshrc"
alias tree="tree -I 'node_modules|vendor|storage|cache|haskell-ide-engine'"
alias t1="tree -tL 1"
alias t1a="tree -atL 1"
alias t2="tree -tL 2 -I 'node_modules|vendor|storage|cache|haskell-ide-engine'"
alias t2a="tree -atL 2"
alias t3="tree -tL 3 -I 'node_modules|vendor|storage|cache|haskell-ide-engine'"
alias lsl="ls -al"
alias l="ls -AFGu"

alias gl="git log --color --graph --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glf="git log --follow -p"
alias gpruned="git branch -vv | grep ': gone]' | cut -w -f 2"
alias grmpruned="gpruned | xargs git branch --delete"

alias rm="trash"
alias del="trash"

alias get="curl -iL"
alias post="curl -iL -X POST"
alias put="curl -iL -X PUT"

alias ports="lsof -nP -iTCP -sTCP:LISTEN"
alias colors="for COLOR in {1..255}; do echo -en \"\e[38;5;\${COLOR}m\${COLOR} \"; done; echo;"

# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
ZSH_DISABLE_COMPFIX=true
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
if [ -e /Users/matthewnelson/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/matthewnelson/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# hook direnv to shell, used by ihp (haskell web framework)
# eval "$(direnv hook zsh)"

# Source zsh_local_aliases file
if [ -f ~/.zsh_local_aliases ]; then
    source ~/.zsh_local_aliases
fi


### Prime autocomplete
autoload -Uz compinit
compinit -i

### enable aws cli autocomplete
autoload bashcompinit && bashcompinit
source /opt/homebrew/share/zsh/site-functions/aws_zsh_completer.sh

[ -f "/Users/mnelson/.ghcup/env" ] && . "/Users/mnelson/.ghcup/env" # ghcup-env
source ~/.npm-completion
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
