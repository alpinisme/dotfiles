# install homebrew
# to-do: insert if statement to check if homebrew already installed
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew tap homebrew/bundle

# install dependencies
brew bundle --file="$dotfiles/Brewfile"


#### add section adding symlinks




# Specify the preferences directory for iterm2
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm2_profile"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
