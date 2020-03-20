# .dotfiles
> Koziej's collection of configuration files

## Overview
Dotfiles are user-specific configuration files that get their name from traditionally starting with a dot.
Users can spend hours configuring software to their liking, and losing these files often means losing countless hours of work.
To solve this issue, many users have chosen to track their configuration files using version control software like Git.
To track my configuration files, I use a method popularized by a [Hacker News comment](https://news.ycombinator.com/item?id=11070797), which involves creating a git bare repository in the user's home directory.

## Setup
Initiate a git bare repository in the user's home folder.
```sh
git init --bare $HOME/.dotfiles
```
Create a shell alias to make tracking files easy.
```sh
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
Tell Git to ignore files that aren't tracked explicitly.
```sh
dotfiles config --local status.showUntrackedFiles no
```
Add the remote repository and pull.
```sh
dotfiles add origin git@github.com:jacobkoziej/.dotfiles.git
dotfiles pull origin
```
