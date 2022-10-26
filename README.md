## Git
### .gitconfig
``` yaml
[user]
    name = username 123
    email = username@gmail.com
    
[code]
    editor = code --await

[alias]
    l = !git log --pretty=format:'%C(blue)%h%C(red)%d %C(white)%s - %C(cyan)%cn, %C(green)%cr'
```

### Multiplas contas git na mesma máquina (Linux)
Insira isso arquivo ``.gitconfig`` global:
```yaml
[includeIf "gitdir:~/any_path/"]
    path = ~/any_path/.gitconfig
```

O ``.gitconfig`` do path informado deve ter o email da outra conta:
```yml
[user]
    email = workemail@workexample.com  
```
**Atenção:** O email da outra conta vai ser utilizado apenas a partir do path informado.

Na pasta ``.ssh`` deve ser criado um arquivo chamado ``config`` da seguinte forma:
```
Host github.com-personal
   HostName github.com
   User git
   IdentityFile ~/.ssh/id_rsa_personal

# Work account
Host gitlab.com-work
   HostName gitlab.com
   User git
   IdentityFile ~/.ssh/id_rsa_work
```
**Atenção:** o campo "Host" vai ser utilizado quando baixar o repositório, por exemplo:
```
git clone git@github-personal:path/to/repo
```
ou
```
git clone git@github-work:path/to/repo
```
*Lembrando as keys ssh deverão ser criadas nessa mesma pasta.*


## React JS + Typescript
### ESlint + Prettier

**packages**
``` terminal
npm install -D @typescript-eslint/eslint-plugin eslint eslint-config-prettier eslint-config-standard-with-typescript eslint-plugin-import eslint-plugin-n eslint-plugin-prettier
 eslint-plugin-promise eslint-plugin-react prettier typescript
```

**.eslintrc.json**
``` json
{
  "settings": {
    "react": {
      "version": "detect"
    }
  },
  "env": {
    "browser": true,
    "es2021": true
  },
  "extends": [
    "plugin:react/recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:prettier/recommended",
    "plugin:react/jsx-runtime"
  ],
  "overrides": [],
  "parserOptions": {
    "ecmaVersion": "latest",
    "sourceType": "module",
    "ecmaFeatures": {
      "jsx": true
    }
  },
  "plugins": [
    "react"
  ],
  "rules": {
    "prettier/prettier": [
      "warn"
    ],
    "no-useless-return": "warn",
    "curly": "error",
    "@typescript-eslint/explicit-function-return-type": "warn",
    "@typescript-eslint/unbound-method": "off",
    "@typescript-eslint/no-unused-vars": [
      "warn",
      {
        "argsIgnorePattern": "^_",
        "varsIgnorePattern": "^_",
        "caughtErrorsIgnorePattern": "^_"
      }
    ],
    "@typescript-eslint/no-inferrable-types": "off",
    "@typescript-eslint/array-type": [
      "warn",
      {
        "default": "array-simple",
        "read-only": "array-simple"
      }
    ],
    "@typescript-eslint/no-explicit-any": "off",
    "@typescript-eslint/no-non-null-assertion": "off"
  }
}
```

**.prettierrc**
```json
{
	"tabWidth": 2,
	"useTabs": true,
	"semi": true,
	"singleQuote": true,
	"arrowParens": "always",
	"bracketSpacing": true,
	"endOfLine": "lf",
	"printWidth": 120,
	"trailingComma": "none",
}
```

**tsconfig.json**
```json
{
	"compilerOptions": {
		"target": "es5",
		"lib": [
			"dom",
			"dom.iterable",
			"esnext"
		],
		"allowJs": true,
		"skipLibCheck": true,
		"esModuleInterop": true,
		"allowSyntheticDefaultImports": true,
		"strict": true,
		"forceConsistentCasingInFileNames": true,
		"noFallthroughCasesInSwitch": true,
		"module": "esnext",
		"moduleResolution": "node",
		"resolveJsonModule": true,
		"isolatedModules": true,
		"noEmit": true,
		"jsx": "react-jsx",
		"baseUrl": "src"
	},
	"include": [
		"src"
	],
}
```

## Oh My Zsh!
[Gist](https://gist.github.com/luizomf/1fe6c67f307fc1df19e58f224134dc8f)

### NVM no ZSH
Adiciona ao final do arquivo .zshrc
```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

### ADB (Android Debug Bridge) no ZSH
```
export PATH="$HOME/Android/Sdk/platform-tools:$PATH"
```


### Essential App - Ubuntu
```shell
#!/bin/sh -x
LIGHT_CYAN='\033[1;36m' # https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
NO_COLOR='\033[0m' # No Color
DIRECTORY_NAME=essentials-apps-config

show_text() {
    printf "${LIGHT_CYAN}$1${NO_COLOR}\n" 
}

delete_directory() {
    rm -rf $DIRECTORY_NAME
}

install_wget() {
    {
        show_text "-> Checking version wget..." 
        wget --version     
    } || {
        show_text "-> Installing wget..." 
        sudo apt install wget
    }
}

install_chrome() {
    show_text "-> Installing chrome..." 
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb
}

install_curl() {
    show_text "-> Installing curl..."
    sudo apt install curl -y
}

install_git() {
    show_text "-> Installing git..."
    sudo apt install git -y
}

install_zsh() {
    show_text "-> Installing zsh and oh-my-zsh..."
    show_text "- Downloading zsh..."
    sudo apt install zsh -y

    show_text "- Changing shell to zsh..."
    chsh -s /bin/zsh

    show_text "- Downloading oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    show_text "- Customizing oh-my-zsh..."
     show_text "- Downloading theme: spaceship.zsh-theme..."
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

    show_text "- Downloading plugin: zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    show_text "- Downloading plugin: zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    show_text "- Downloading and set font ubuntu-mono-powerline..."
    mkdir -p ~/.fonts
    git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf
    fc-cache -vf

    show_text "- Set theme..."
    sed -i "/ZSH_THEME=/c ZSH_THEME=\"spaceship\"" ~/.zshrc

    show_text "- Set plugins..."
    sed -i "/plugins=/c plugins=(git zsh-autosuggestions zsh-syntax-highlighting)" ~/.zshrc
}

install_nvm() {
    show_text "-> Installing nvm..."
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

    [echo $0 -eq zsh] && {
        grep -rn '~/.zshrc' -e 'export NVM_DIR='
        [echo $? -eq 0] && {
            echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.zshrc
            echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"  # This loads nvm" >> ~/.zshrc
            echo "[ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\"  # This loads nvm bash_completion" >> ~/.zshrc

            source ~/.zshrc
        }
    }
}

install_vscode() {
    show_text "-> Installing vscode..."
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt install code
}

install_gparted() {
    show_text "-> Installing gparted..."
    sudo apt install gparted -y
}

clear
show_text "[Author: Bruno Batalha]"
show_text "-> Creating directory for settings..."
delete_directory
cd ~/
mkdir $DIRECTORY_NAME

{
    show_text "-> Entering directory..." 
    cd $DIRECTORY_NAME
    
    show_text "-> Sudo update and upgrade..."
    sudo apt update -y && sudo apt upgrade -y

    install_wget
    install_chrome
    install_git
    install_curl
    install_zsh
    install_nvm
    install_vscode
    install_gparted
    
    show_text "-> Sudo autoremove and delete directory for settings..." 
    sudo apt autoremove -y
    delete_directory
} || {
    delete_directory
}
```
