############### alias ###############
# alias (ls)
alias ls='ls -G'
alias la='ls -a'

# alias (git)
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

############### git branchの表示 ###############
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='✌️ \[\033[32m\]\u:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '


############### bash_completion ###############
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
