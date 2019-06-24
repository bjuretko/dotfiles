# MacOS dotfiles

Dotfiles and initial setup of my mac.

Shortcut for initial setup
1. checkout this repos
2. call `./setup.sh`

# homebrew

install according to https://brew.sh

```
brew tap caskroom/cask
brew tap caskroom/versions
brew tap buo/cask-upgrade
brew tap homebrew/cask-fonts 
brew cask
```

Reinstall :

```
brew install $(cat ./homebrew/list)
brew cask install $(cat ./homebrew/cask.list)
```

## create lists

```
brew list > homebrew/list
brew cask list > homebrew/cask.list
```

# parallels

brew cask install parallels-desktop@13.3.2

# vscode

> Install extension [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) and sync settings and extensions stored in github gist.

# docker

```
brew install docker docker-compose docker-machine
```
> Use [machine-share](https://www.npmjs.com/package/machine-share) to import / export docker-machine configs

```
npm i -g machine-share
```

# Apple App Store

http://macappstore.org/

```
brew install mas
```

```bash
mas install 937984704  # Amphetamine
mas install 497799835  # Xcode
mas install 472226235  # LanScan
mas install 1180461298 # cpuinfo
mas install 425424353  # The Unarchiver
mas install 638161122  # YubiKey Personalization Tool
mas install 1039633667 # Irvue
mas install 1415866782 # CoffeeCup
mas install 1333542190 # 1Password 7
```

## NightOwl

https://nightowl.kramser.xyz/
