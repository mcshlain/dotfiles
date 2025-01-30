# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?

ZSH_CUSTOM=$HOME/.zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python colorize)

# User configuration
export SVN_EDITOR=vim

# set locally to xterm, and in remote session to screen since
# it affects tmux and vim
if (( ${+TMUX} )); then
    export TERM=screen-256color
else
    export TERM=xterm-256color
fi


VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR
# export MANPATH="/usr/local/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias ls='ls --color'
alias la='ls -a'
alias ll='ls -ltrh'
alias vi='nvim'
alias vim='nvim'
alias ff='find . -type f -name '
alias psg='ps -e | grep -i '
alias du='du -h'
alias df='df -h'
alias tmux='tmux -2'
alias terminate='sudo shutdown 0'
alias bc3=bcompare
alias xclip="xclip -selection c"
alias yank="yank-cli"
alias pipen="pipenv"
alias frigg="cd ~/projects/frigg/frigg"
alias spike="cd ~/projects/spike"
alias alila="cd ~/projects/ai2i-agents/agents/mabool/ui/packages/debug-console"
alias spikeu="cd ~/projects/spike/frontend/packages/spike"
alias nconf="cd ~/.dotfiles/nvim/.config/nvim"
alias mabool="cd ~/projects/ai2i-agents/agents/mabool/api"
alias gs="git status"
alias go="git checkout"
alias gc="git commit -m"
alias gca="git commit -am"
alias gl="git log"
alias nora="cd ~/projects/nora"

# Theme configuration
#BULLETTRAIN_DIR_CONTEXT_SHOW=true
BULLETTRAIN_STATUS_EXIT_SHOW=true

# Full path
BULLETTRAIN_DIR_EXTENDED=2 

# Conda cart colors
BULLETTRAIN_VIRTUALENV_BG=green
BULLETTRAIN_VIRTUALENV_FG=white

BULLETTRAIN_GIT_BG=black
BULLETTRAIN_GIT_FG=white
BULLETTRAIN_PROMPT_ORDER=(
  virtualenv
  time
  #context
  dir
  git
  status
)

export DEVBOX_NO_PROMPT=true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mcshlain/apps/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mcshlain/apps/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mcshlain/apps/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mcshlain/apps/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mcshlain/apps/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mcshlain/apps/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mcshlain/apps/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mcshlain/apps/google-cloud-sdk/completion.zsh.inc'; fi

conda activate py311
