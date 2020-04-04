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
  export EDITOR='code'
fi
#export BROWSER="google-chrome-stable"
export BROWSER="firefox-developer-edition"
export ARCHFLAGS="-arch x86_64"
#export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH="${PATH}:/opt/conda/bin"

# misc
setopt NO_BEEP
setxkbmap de us

# alias
alias remake='make clean && clear && make all -j$(nproc)'
alias update='figlet -f slant "pacman" | boxes -d stone && sudo pacman -Syu --noconfirm && echo -e "\n\n" && figlet -f slant "aur" | boxes -d stone && yaourt -Syu --aur --noconfirm'
alias matlab='matlab -desktop'
alias reconnect='sudo systemctl restart netctl-auto@wlp58s0.service'
boxfct(){
    cp -r $1 ~/Dropbox/exchange/tmp/
}
alias box=boxfct
alias pigo='ping 8.8.8.8'
alias scr='source ~/.scripts/screenAutoConfig.sh'
alias suspend='systemctl suspend'
alias lock='~/.scripts/lock.sh'
alias t=todo.sh

#alias peak="wine ~/.wine/drive_c/Program\ Files/peak/bin/peak64.exe --jdkhome 'C:/Program Files/Java/jdk1.8.0_202/'"
alias peak="wine ~/.wine/drive_c/Program\ Files/peak/bin/peak64.exe"
#alias fenics_run='docker exec -w /home/fenics/shared/code -u fenics fenics'
#alias fenics_run='docker exec -w /home/shared/code fenics_service'
alias openmc_cluster_run='docker exec -e DISPLAY -u openmc openmc_cluster'
alias openmc_run='docker exec -e DISPLAY -u openmc openmc'
alias monsieur='sudo openvpn --cd /home/jannick/Dropbox/exchange/openvpn/ --config ws.ovpn'
alias sony='bluetoothctl power off && bluetoothctl power on && bluetoothctl connect 04:5D:4B:53:72:1F && pactl set-sink-volume bluez_sink.04_5D_4B_53_72_1F.a2dp_sink 50%'
alias fenics="docker run -ti --rm -w /home/shared/code -v fenics-cache:/home/cache -v $(pwd):/home/shared/code -v /home/jannick/Projects/NeutronDiffusion/data/:/home/shared/data -e OMP_NUM_THREADS=1 -e DIJITSO_CACHE_DIR=/home/cache/dijitso fenics_spn:service"
alias ipad='cd ~/Documents/quicktime_video_hack/ && sudo ./run.sh'
export OPENMC_CROSS_SECTIONS="/opt/openmc/data/cross_sections.xml"
