# ==================================================================================
# My Stuff
# ==================================================================================
#eval sh $HOME/.config/base16-shell/base16-tomorrow.dark.sh
#eval sh $HOME/.config/base16-shell/base16-ocean.dark.sh

# environment variables
#set -g -x fish_term24bit 1
set -g -x FZF_DEFAULT_COMMAND 'ag -l -g ""'
set -g -x FZF_DEFAULT_OPTS '--color fg:251,bg:234,hl:167,fg+:178,bg+:236,hl+:167 --color info:183,prompt:110,spinner:107,pointer:167,marker:215'
set -x DOCKER_HOST tcp://192.168.99.100:2376
set -x DOCKER_CERT_PATH /Users/Ironfish/.docker/machine/machines/default
set -x DOCKER_TLS_VERIFY 1
set -x DOCKER_MACHINE_NAME "default"

# app aliases
# alias nvim 'env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

# edit aliases
alias ef 'nvim ~/GitHub/config/fish/config.fish'
alias en 'nvim ~/GitHub/config/nvim/init.vim'

# cd aliases
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias cdg 'cd ~/GitHub'
alias cdc 'cd ~/GitHub/config'

# git aliases
alias ga 'git add .'
alias gc 'git commit -m'
alias gcd 'git checkout -b'
alias gp 'git pull'
alias gpo 'git push origin'
alias gs 'git status'

# sbt aliases
alias scc 'sbt clean compile'
alias st  'sbt test'
set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish
