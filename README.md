# MacOS dotfiles

Dotfiles and initial setup of my mac.

# homebrew

install according to https://brew.sh

```
brew tap caskroom/cask
brew tap caskroom/versions
brew tap buo/cask-upgrade
brew cask
```

Reinstall :

```
brew install $(cat ./homebrew/list)
brew cask install $(cat ./homebrew/cask.list)
```

TODO: Packages below should go into the lists


# browser
```
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install firefox
brew cask install firefox-beta
```

# development

```
brew cask install sublime-text
brew cask install iterm2
brew cask install sourcetree
brew cask install parallels-desktop
```

## vscode

```
brew cask install visual-studio-code
```

> Install extension [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) and sync settings and extensions stored in github gist.

## docker

```
brew install docker docker-compose docker-machine
```
> Use [machine-share](https://www.npmjs.com/package/machine-share) to import / export docker-machine configs

## bitbar

```
brew cask install bitbar
```

# other

```
brew cask install cheatsheet
brew cask install spectacle
brew cask install itsycal
brew cask install skitch
brew cask install the-unarchiver
brew cask install slack
brew cask install gas-mask

brew install caskformula/caskformula/inkscape
brew cask install gimp

brew cask install spotify

brew cask install skype
brew cask install skype-for-business
brew install keybase
```

# Apple App Store

http://macappstore.org/

```
brew install mas
```

```bash
mas install 937984704 # Amphetamine
mas install 497799835 # Xcode
mas install 472226235 # LanScan
mas install 1180461298 # cpuinfo
```


## NightOwl

https://nightowl.kramser.xyz/
