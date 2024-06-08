#!/bin/sh
zshrc() {
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/djui/alias-tips ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    yes | sudo sh -c ~/.fzf/install
    git clone https://github.com/wting/autojump.git /tmp/autojump
    CURRENT_DIR=$(pwd) && cd /tmp/autojump && ./install.py && cd $CURRENT_DIR && rm -rf /tmp/auto-jump
    git clone https://github.com/Licheam/zsh-ask ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-ask
    mv -f $HOME/dots/zshrc $HOME/.zshrc
    mv -f $HOME/dots/p10k.zsh $HOME/.p10k.zsh
}

# change time zone
sudo ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime
sudo dpkg-reconfigure --frontend noninteractive tzdata

zshrc

# force zsh
echo 'exec zsh' >> ~/.bashrc
source ~/.bashrc

# make directly highlighting readable - needs to be after zshrc line
echo "" >> ~/.zshrc
echo "# remove ls and directory completion highlight color" >> ~/.zshrc
echo "_ls_colors=':ow=01;33'" >> ~/.zshrc
echo 'zstyle ":completion:*:default" list-colors "${(s.:.)_ls_colors}"' >> ~/.zshrc
echo 'LS_COLORS+=$_ls_colors' >> ~/.zshrc

USER=$(whoami)
NGINX_DIR="/home/$USER/workspace/nginx"
SOURCE_FILE="$HOME/workspace/nginx.conf"
sudo sed -e "s|\${USER}|$USER|g" -e "s|\${NGINX_DIR}|$NGINX_DIR|g" "$SOURCE_FILE" > "$SOURCE_FILE"

rm -rf ~/dots
rm -rf ~/README.md
rm -rf ~/install.sh
