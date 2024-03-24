BASE_DIR=$(dirname "$0")
: "${ZSH_CUSTOM:=$HOME/.oh-my-zsh/custom}"

sudo apt-get update -y

# zsh
sudo apt-get install -y zsh
sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

# oh-my-zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo apt install fonts-powerline​

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# oh-my-zsh plugins
git clone https://github.com/djui/alias-tips $ZSH_CUSTOM/plugins/alias-tips
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search $ZSH_CUSTOM/plugins/zsh-history-substring-search
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
source ~/.fzf/install​

# rc
ln -f $BASE_DIR/.zshrc $HOME/.zshrc

# p10k config
ln -f $BASE_DIR/.p10k.zsh $HOME/.p10k.zsh
