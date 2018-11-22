set PATH /home/caio/bin/ /home/caio/.gem/ruby/2.5.0/bin $PATH

set fish_greeting

alias l='ls --literal --color=auto --group-directories-first'
alias la='l -l --human-readable --all'

alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'

alias p='pacaur'
alias tmux='tmux -2'
alias ta='tmux attach'
alias mkd='mkdir -pv'

alias listenmoe='mpv https://listen.moe/opus'

# Start X at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx
  end
end
