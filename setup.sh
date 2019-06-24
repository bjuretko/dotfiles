#!/bin/sh

echo 🔗 Symlinking dotfiles ...
cat dotfiles.ls | xargs -I {} ln -sfv `pwd`/{} ~/{}

echo 🍻 Homebrewing ...
echo

brew tap caskroom/cask
brew tap caskroom/versions
brew tap buo/cask-upgrade
brew tap homebrew/cask-fonts
brew cask

brew install $(cat ./homebrew/list)
brew cask install $(cat ./homebrew/cask.list)

echo 🍏 Installing apps ...
echo

mas install 937984704  # Amphetamine
mas install 497799835  # Xcode
mas install 472226235  # LanScan
mas install 1180461298 # cpuinfo
mas install 425424353  # The Unarchiver
mas install 638161122  # YubiKey Personalization Tool
mas install 1039633667 # Irvue
mas install 1415866782 # CoffeeCup
mas install 1333542190 # 1Password 7
