set fish_greeting ""
alias vim "nvim"
set -gx PATH /home/caio/.local/bin /home/caio/bin /home/caio/.gem/ruby/2.2.0/bin $HOME/.rbenv/bin /usr/games /home/caio/.cabal/bin ~/.cabal/bin .cabal-sandbox/bin $PATH

# start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
        exec startx -- -keeptty
    end
end

function fuck
    eval sudo $history[1]
end

# Git aliases
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gd='git diff'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gp='git pull'
alias push='git push'
alias gr='git rebase'
alias gm='git merge'
