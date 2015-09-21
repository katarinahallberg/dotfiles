# Git aliases
#

alias g='git'

# Base commands
alias gco='git checkout'
alias gf='git fetch'
alias gm='git merge'
alias gl='git pull'
alias gp='git push'
alias gcp='git cherry-pick'
alias gr='git remote'

# Add
alias ga='git add'
alias gaa='git add --all'
alias gap='git add --patch'
alias gb='git branch'

# Branch
alias gba='git branch -a'
alias gbr='git branch --remote'
alias gc!='git commit -v --amend'

# Commit
alias gc='git commit -v'
alias gca!='git commit -v -a --amend'
alias gca='git commit -v -a'
alias gcmsg='git commit -m'

# Rebase
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'

# Diff
alias gd='git diff'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdt='git difftool'

# Stashing
alias gsta='git stash'
alias gstd='git stash drop'
alias gstp='git stash pop'
alias gsts='git stash show --text'

# Status
alias gst='git status'
alias gss='git status -s'

# Log
alias glg='git log --stat --max-count=10'
alias glgg='git log --graph --max-count=10'
alias glgga='git log --graph --decorate --all'
alias glo='git log --oneline --decorate --color'
alias glog='git log --oneline --decorate --color --graph'
alias gcount='git shortlog -sn'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

# Other (unsorted)
alias gcl='git config --list'
alias gclean='git reset --hard && git clean -dfx'
alias gcm='git checkout master'
alias glr='git pull --rebase'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'
alias grv='git remote -v'
alias gvt='git verify-tag'

# Will cd into the top of the current repository
# or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

# Work In Progress (wip)
# These features allow to pause a branch development and switch to another one (wip)
# When you want to go back to work, just unwip it
#
# This function return a warning if the current branch is a wip
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!"
  fi
}
# these alias commit and uncomit wip branches
alias gwip='git add -A; git ls-files --deleted -z | xargs git rm; git commit -m "--wip--"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

# these alias ignore changes to file
alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'

# list temporarily ignored files
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
