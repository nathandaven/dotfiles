# install brew
echo "----------------------------"
echo "Installing brew"
echo "----------------------------"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Brew applications
echo "----------------------------"
echo "Installing apps via brew"
echo "----------------------------"
brew install \
	orbstack \
	neofetch \
        tmux
	
# Brew casks
echo "----------------------------"
echo "Installing casks via brew"
echo "----------------------------"
brew install --cask \
	visual-studio-code \
	font-fira-code \
	tailscale \
	wezterm
  
# ZSH
echo "----------------------------"
echo "Installing ohmyzsh and p10k"
echo "----------------------------"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install powerlevel10k

# ZSH plugins
echo "----------------------------"
echo "Installing ohmyzsh plugins"
echo "----------------------------"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
brew install pygments zoxide fzf


