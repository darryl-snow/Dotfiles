alias cd..="cd ../"
alias mkdir="mkdir -pv"
alias ls="ls -Glha"
alias l="ls"
alias ll="ls -la"
alias ping="ping -c 5"
alias lp="ls -p"
alias h=history
alias cdg="cd ~/Documents/git"
alias weather="printf '\e[8;100;130t' && curl -4 wttr.in/Singapore?m"
alias mongodb="mongod --dbpath /Users/darryl/data/db"
alias ack="ack --css '\d*\.\d*px' && ack --css -i '#[-_a-z][-_a-z0-9]*(?=[^}]*\{)' && ack --css -i 'background:\s*#[a-f0-9]*;' && ack --css '\b0(px|r?em)'"


export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export ANDROID_HOME=/Users/username/Downloads/adt-bundle-mac-x86_64-20131030/sdk/tools
export PATH=$PATH:$ANDROID_HOME/tools

sitespeed() {
  sitespeed.io -b chrome -n 3 --browsertime.viewPort 320x480 -c native -d 1 -m 1 $1
}

# Kill process on port xxxx
killport(){

	if [ -z "$1" ]; then
		echo "Usage: searchAndDestroy [numeric port identifier]" >&2
		return 1
	fi
	lsof -i TCP:$1 | awk '/LISTEN/{print $2}' | xargs kill -9

}

# Go up x directories
up() {
	LIMIT=$1
    P=$PWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=$P/..
    done
    cd $P
}

# Go back to the previous directory
back() {
	LIMIT=$1
    P=$MPWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=${P%/..}
    done
    cd $P
    export MPWD=$P
}

# Zip up large files into 10mb chunks
bzip() {
  ext=.zip
  zip -r -s 10m $1$ext $1
}

# Get system info
myinfo () {
  uname -a | awk '{ printf "Kernel: %s " , $3 }'
  uname -m | awk '{ printf "%s | " , $1 }'
  printf "\n"
  uptime | awk '{ printf "Uptime: %s %s %s", $3, $4, $5 }' | sed 's/,//g'
  printf "\n"
}

# Resize the terminal window and dock to the top left corner
printf '\e[3;0;0t' && printf '\e[8;100;130t'
echo "Hi $USER!"
echo -e "Today is $(date)\nUptime: $(uptime)"
