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
set -x SBT_OPTS "-Xms512M -Xmx2048M -Xss6M -XX:MaxMetaspaceSize=512m -XX:+CMSClassUnloadingEnabled"

# setting for sushi theme
set -x theme_complete_path "yes"

# app aliases
# alias nvim 'env NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

# edit aliases
alias ef 'nvim ~/GitHub/config/fish/config.fish'
alias en 'nvim ~/GitHub/config/nvim/init.vim'

# cd aliases
alias ...   'cd ../..'
alias ....  'cd ../../..'
alias ..... 'cd ../../../..'
alias cdg   'cd ~/GitHub'
alias cdgc  'cd ~/GitHub/cinnamon'
alias cdc   'cd ~/GitHub/config'

# docker aliases
alias dmstart 'echo "docker-machine start default"; docker-machine start default'
alias dmstop  'echo "docker-machine stop default"; docker-machine stop default'
alias dmssh   'echo "docker-machine ssh default"; docker-machine ssh default'
alias dmenv   'echo "docker-machine env default"; docker-machine env default'

# git aliases
alias ga='echo "git add ."; git add .'
alias gba='echo "git branch -a"; git branch -a'
alias gc='git commit -m'
alias gcd='git checkout -b'
alias gl="clear ;and git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gp='echo "git pull"; git pull'
alias gpo='git push origin'
alias gs='echo "git status"; git status'
alias gt='echo "git tag"; git status'

# sbt aliases
alias scc='echo "sbt -mem 2048 clean compile"; sbt -mem 2048 clean compile'
alias st='echo "sbt -mem 2048 test"; sbt -mem 2048 test'
alias sr='echo "sbt -mem 2048 run"; sbt -mem 2048 run'

for file in ~/.config/fish/conf.d/*.fish
    source $file
end

set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
# source $fisher_home/config.fish
