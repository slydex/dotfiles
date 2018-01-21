export ZSH=~/.oh-my-zsh
ZSH_THEME="slydex"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# exports 
export LANG=en_US.UTF-8
#export MATLAB_JAVA=/usr/lib/jvm/java-7-openjdk/jre
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='gvim'
fi
#export BROWSER="google-chrome-stable"
export BROWSER="firefox-developer-edition"
export ARCHFLAGS="-arch x86_64"
#export SSH_KEY_PATH="~/.ssh/rsa_id"

# misc
setopt NO_BEEP
setxkbmap de us

# alias
alias remake='make clean && clear && make all -j$(nproc)'
alias update='figlet -f slant "pacman" | boxes -d stone && sudo pacman -Syu --noconfirm && echo -e "\n\n" && figlet -f slant "aur" | boxes -d stone && yaourt -Syu --aur --noconfirm'
alias matlab='matlab -desktop'
alias reconnect='sudo systemctl restart netctl-auto@wlp3s0.service'
boxfct(){
    cp -r $1 ~/Dropbox/exchange/tmp/
}
alias box=boxfct
alias pigo='ping 8.8.8.8'
alias scr='source ~/.scripts/screenAutoConfig.sh'
alias suspend='systemctl suspend'
alias lock='~/.scripts/lock.sh'

alias win='~/.scripts/win10.sh'
alias mnt_nas='mount /mnt/nas/video && mount /mnt/nas/music && mount /mnt/nas/home && mount /mnt/nas/pictures'
