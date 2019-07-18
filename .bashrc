# .bashrc is executed on every interactive shell
# see .profile for definitions for login shells only

export LC_ALL=C
# set PATH so it includes user's private bin directories

# Python
export PATH=$PATH:~/Library/Python/2.7/bin

# Go
export GOPATH=$HOME/.go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Miniconda3
export PATH="/Users/benedict/miniconda3/bin:$PATH"

# local binaries
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"