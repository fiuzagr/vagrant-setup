# VIRTUALBOX & FIREWALL
vm_inicia() {
    $HOME/._dev/vm.sh $1
}
alias virtualizacao=vm_inicia

# ALIAS
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killal$'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killa$'
alias ubuntu='ssh vagrant@localhost -p 2222'
alias nuts='cd ~/Public/NUTS'
alias meteoro='cd ~/Public/METEORO'
alias dev='cd ~/Public/DEV'
alias confs='cd ~/Public/CONFS'
