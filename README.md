# posh-git-alias

Oh-My-ZSH Git alias in PowerShell


# Usage

```
git clone git@github.com:chengcyber/posh-git-alias.git
```

Create a PowerShell profile(if you don't already have one):

```
New-Item -Type file -Path $PROFILE -Force
```

Open it to edit:

```
notpad $PROFILE
```

Add the following posh:

```
. <PATH_TO_CLONED_PROJECT>\git.plugin.ps1
```

Rerun PowerShell or reload your profile immediately:

```
. $PROFILE
```