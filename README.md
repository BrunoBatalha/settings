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

### Install ZSH
Installation
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
