# VIRTUALBOX & FIREWALL
vm_inicia() {
    $HOME/._dev/vm.sh $1
}
alias virtualizacao=vm_inicia

# ALIAS
alias hideFiles = 'defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias showFiles = 'defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias ubuntu    = 'ssh vagrant@localhost -p 2222'
alias nuts      = 'cd ~/Public/NUTS'
alias meteoro   = 'cd ~/Public/METEORO'
alias dev       = 'cd ~/Public/DEV'