# MacOS dotfiles

Dotfiles and initial setup of my Mac.

Shortcut for initial setup:

1. Clone this repository
2. 🍻 Install [homebrew](https://brew.sh) as described [here](https://docs.brew.sh/Installation) and execute

   ```sh
   brew analytics off
   ```

   afterwards.

3. Install applications ...

   ```sh
   brew bundle
   ```

   This will install  and common used packages.

4. 🔗 Symlink dotfiles with

   ```sh
   xargs -I {} ln -sfv "$(pwd)/{}" ~/{} < dotfiles.ls
   ```

## Update homebrew package lists

In the root directory of this project, update the Brewfile with

```sh
brew bundle dump --describe -f
```

You can cleanup other dependencies which are not in Brewfile with `brew bundle cleanup`


## Visual Studio Code

Install extension [Settings Sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) and sync settings and extensions stored in github gist, not using VS Code's included sync mechanism.

## Docker and Kubernetes

Docker and Kubernetes Tools are installed via homebrew and includes docker-compose and docker-machine. Use Brewfile.oci to install the standard tools.
To import (export) docker machines configurations
use [machine-share](https://www.npmjs.com/package/machine-share).

```sh
npm i -g machine-share
```

## Mac App Store

Installation of native Mac Apps can be automated with [MacAppStore](http://macappstore.org/). The mas installed apps are included in the Brewfile as well.

Get a list of installed apps with `mas list`. 
To manage apps with mas you need to signin with `mas signin`.
