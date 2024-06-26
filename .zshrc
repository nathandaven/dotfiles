# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]

# prompt on bottom
# tput cup "$(tput lines)"
# alias clear="clear && tput cup '$(tput lines-1)'"

# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Plugin config options
# NVM
# export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_HOMEBREW=/opt/homebrew/opt/nvm
# export NVM_LAZY=1
# zstyle ':omz:plugins:nvm' lazy yes

# Colorize
export ZSH_COLORIZE_STYLE="rrt"
alias cat="ccat"

# Tmux
# export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_UNICODE=true

# Gcloud
# Use a python you have installed in a special location
export CLOUDSDK_PYTHON=/usr/local/Cellar/python@3.9/3.9.19/libexec/bin/python3

# lazygit
export XDG_CONFIG_HOME="$HOME/.config"

# dotenv
ZSH_DOTENV_PROMPT=false

plugins=(
  evalcache
  zsh-nvm
  nvm
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  tmux
  history
  npm
  macos
  vscode
  sudo
  man
  dotenv
  copyfile
  copypath
  common-aliases
  colorize
  gcloud
  helm
  docker
  kubectl
  fzf
  zoxide
)
# compctl -g '~/.itermocil/*(:t:r)' itermocil
source $ZSH/oh-my-zsh.sh

# colorls gem
# if [ -x "$(command -v colorls)" ]; then
#     alias ls="colorls"
#     alias la="colorls -al"
# fi

# exa ls coloring
# if [ -x "$(command -v exa)" ]; then
#     alias ls="exa"
#     alias la="exa --long --all --group"
# fi


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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias cleanphoto="exiftool -mpf:all= -trailer:all= "

alias spotify="spotify_player"
alias clock="tty-clock  -s -c -t"
alias pipes="pipes.sh"
alias bonsai="cbonsai"
alias matrix="cmatrix"

# todo
alias nvim="NVIM_ZEN_MODE=1 nvim"

# Created by `pipx` on 2023-12-29 03:25:06
export PATH="$PATH:/Users/nathandaven/.local/bin"

# export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# 

# color overrides
ZSH_HIGHLIGHT_STYLES[comment]="fg=magenta"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#897d66"
# fg=white,bold,bg=#ff00ff,bold 756b57

# use zoxide as cd
alias cd="z"
alias cdi="zi"

# lazygit
alias lgit="lazygit"

# import local zshrc
if [[ -r "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
