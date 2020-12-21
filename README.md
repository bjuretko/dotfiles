# MacOS dotfiles

Dotfiles and initial setup of my Mac.

Shortcut for initial setup:

1. checkout this repository
2. call `./setup.sh`

This will install [homebrew](https://brew.sh) and common used packages.

For re-install:

```sh
brew install $(cat ./homebrew/list)
brew cask install $(cat ./homebrew/cask.list)
```

## Update homebrew package lists

Check for installed taps with `brew tap-info --installed` and add them manually
to `setup.sh`. 

```sh
brew list --formula > homebrew/list
brew list --cask > homebrew/cask.list
```

## vscode

Install extension [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) and sync settings and extensions stored in github gist, not using VS Code's included sync mechanism.

## docker

Docker is installed via homebrew and includes docker-compose and docker-machine.
To import (export) docker machines configurations
use [machine-share](https://www.npmjs.com/package/machine-share).

```sh
npm i -g machine-share
```

## Apple App Store

Installation of native Mac Apps can be automated with [MacAppStore](http://macappstore.org/)

```sh
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
