## How to install environment default on Ubuntu
Install curl:
```
sudo apt install curl -y
```

Run command:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/BrunoBatalha/settings/main/ubuntu/linux-env-default-install.sh)"
```


## How to install zsh terminal
1. Install ZSH
```
sudo apt install zsh -y && chsh -s /bin/zsh && zsh
```

2. Install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

3. Customizing
```
# "- Downloading theme: spaceship.zsh-theme..."
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# "- Downloading plugin: zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# "- Downloading plugin: zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# "- Downloading and set font ubuntu-mono-powerline..."
mkdir -p ~/.fonts
git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf
fc-cache -vf

# "- Set theme..."
sed -i "/ZSH_THEME=/c ZSH_THEME=\"spaceship\"" ~/.zshrc

# "- Set plugins..."
sed -i "/plugins=/c plugins=(git zsh-autosuggestions zsh-syntax-highlighting)" ~/.zshrc
```


## How to set NVM in ZSH
Added in ~/.zshrc
```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

## ADB (Android Debug Bridge) in ZSH
Added in ~/.zshrc
```
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
```

## How to install Docker
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/BrunoBatalha/settings/main/ubuntu/install-docker.sh)"
```
