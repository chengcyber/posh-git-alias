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
notepad $PROFILE
```

Add the following posh:

```
. <PATH_TO_CLONED_PROJECT>\git.plugin.ps1
```

Rerun PowerShell or reload your profile immediately:

```
. $PROFILE
```

# Resources

- [git.plugin.zsh](https://github.com/ohmyzsh/ohmyzsh/blob/f0f42828fa6842af631cc3dbf45f5454ea88fa3c/plugins/git/git.plugin.zsh)
- [$profile Gist](https://gist.github.com/dunckr/8334213)
- [AlexZeitler/posh-git-alias](https://github.com/AlexZeitler/posh-git-alias)

# LICENSE

MIT @[chengcyber](https://github.com/chengcyber)