alias qj="export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152"

PATH=~/.local/bin:~/flutter/bin:~/.pyenv/shims:$PATH

alias brew_bump="brew doctor; brew update; brew upgrade"


function amend
  set current_branch (git rev-parse --abbrev-ref HEAD)
  git add .
  git commit --amend --no-edit
  git push --set-upstream origin $current_branch -f
end

function rebase_upstream
	git fetch upstream;
	git rebase upstream/$argv[1];
end



function git_replace
    set a $argv[1]
    set b $argv[2]
    git grep -E -l $a | xargs sed -i "s/$a/$b/g";
end

alias gstash="git stash --include-untracked"
alias gapply="git stash apply"



