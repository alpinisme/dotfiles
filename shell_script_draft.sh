# install homebrew
# to-do: insert if statement to check if homebrew already installed
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew tap homebrew/bundle

# install dependencies
brew bundle --file="$dotfiles/Brewfile"

