# https://github.com/ohmyzsh/ohmyzsh/blob/f0f42828fa6842af631cc3dbf45f5454ea88fa3c/plugins/git/git.plugin.zsh

# Remove Defaults
Rename-Item alias:\gc gk -Force
rename-item alias:\gcm gkm -Force
# rename-item alias:\gcs gks -Force

New-Alias grep findstr

function git_current_branch() {
    git rev-parse --git-dir > $null
    if (-Not $?) {
        return
    }
    $current_branch = (git symbolic-ref --short -q HEAD)
    Write-Output $current_branch
}

function git_main_branch() {
    git rev-parse --git-dir > $null
    if (-Not $?) {
        return
    }
    # "refs/{heads,remotes/{origin,upstream}}/{main,trunk}" 
    $refArr = @(
        'refs/heads/main'
        'refs/heads/trunk'
        'refs/remotes/origin/main'
        'refs/remotes/origin/trunk'
        'refs/remotes/upstream/main'
        'refs/remotes/upstream/trunk'
    )
    foreach ( $ref in $refArr) {
        git show-ref -q --verify $ref
        if ($?) {
            Write-Output ($ref -replace '.*/')
            return
        }
    }
    Write-Output 'master'
}

function git_develop_branch() {
    git rev-parse --git-dir > $null
    if (-Not $?) {
        return
    }
    foreach ( $guess in @('dev', 'devel', 'development')) {
        git show-ref -q --verify refs/heads/$guess
        if ($?) {
            Write-Output $guess
            return
        }
    }
    Write-Output 'develop'
}


###

Set-Alias -Name g -Value git

function ga() {
    git add $args
}

function gaa() {
    git add --all $args
}

function gapa() {
    git add --patch $args
}

function gau() {
    git add --update $args
}

function gap() {
    git apply $args
}

function gapt() {
    git apply --3way $args
}


###

function gb() {
    git branch $args
}

function gba() {
    git branch -a $args
}

function gbd() {
    git branch -d $args
}

function gbda() {
    # TODO: alias gbda='git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch -d 2>/dev/null'
}

function gbD() {
    git branch -D $args
}

function gbl() {
    git blame -b -w $args
}

function gbnm() {
    git branch --no-merged $args
}

function gbr() {
    git branch --remote $args
}

function gbs() {
    git bisect $args
}

function gbsb() {
    git bisect bad $args
}

function gbsg() {
    git bisect good $args
}

function gbsr() {
    git bisect reset $args
}

function gbss() {
    git bisect start $args
}


###

function gc() {
    git commit -v $args
}

function gc!() {
    git commit -v --amend $args
}

function gcn!() {
    git commit -v --no-edit --amend $args
}
Set-Alias -Name gcn! -Value git-commit-amend-no-edit

function gca() {
    git commit -v -a $args
}

function gca!() {
    git commit -v -a --amend $args
}

function gcan!() {
    git commit -v -a --no-edit --amend $args
}

function gcans!() {
    git commit -v -a -s --no-edit --amend $args
}

function gcam() {
    git commit -a -m $args
}

function gcsm() {
    git commit -s -m $args
}

function gcas() {
    git commit -a -s $args
}

function gcasm() {
    git commit -a -s -m $args
}

function gcb() {
    git checkout -b $args
}

function gcf() {
    git config --list $args
}

###

function gcl() {
    git clone --recurse-submodules $args
}

function gclean() {
    git clean -id $args
}

function gpristine() {
    git reset --hard
    git clean -dffx
}

function gcm() {
    git checkout (git_main_branch) $args
}

function gcd() {
    $dev_branch=(git_develop_branch)
    git checkout $dev_branch $args
}

function gcmsg() {
    git commit -m $args
}

function gco() {
    git checkout $args
}

function gcor() {
    git checkout --recurse-submodules $args
}

function gcount() {
    git shortlog -sn $args
}

function gcp() {
    git cherry-pick $args
}

function gcpa() {
    git cherry-pick --abort $args
}

function gcpc() {
    git cherry-pick --continue $args
}

function gcs() {
    git commit -S $args
}

function gcss() {
    git commit -S -s $args
}

function gcssm() {
    git commit -S -s -m $args
}

###

function gd() {
    git diff $args
}

function gdca() {
    git diff --cached $args
}

function gdcw() {
    git diff --cached --word-diff $args
}

function gdct() {
    $tag = (git rev-list --tags --max-count=1)
    git describe --tags $tag $args
}

function gds() {
    git diff --staged $args
}

function gdt() {
    git diff-tree --no-commit-id --name-only -r $args
}

function gdup() {
    git diff '@{upstream}' $args
}

function gdw() {
    git diff --word-diff $args
}

###

function gd() {
    git fetch $args
}

function gfa() {
    # --jobs=<n> was added in git 2.8
    git fetch --all --prune --jobs=10 $args
}

function gfo() {
    git fetch origin
}

function gfg() {
    # TODO: alias gfg='git ls-files | grep'
}


function gg() {
    git gui citool
}
Set-Alias -Name gg -Value git-gui-citool

function gga() {
    git gui citool --amend
}


# TODO: L196

function gpsup() {
    git push --set-upstream origin (git_current_branch)
} 

function gst() {
    git status $args
}

function gpf() {
    git push --force-with-lease
}

function grbi() {
    git rebase -i --autosquash $args
}

function glg() {
    git log --stat $args
}