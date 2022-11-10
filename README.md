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

# Git tips
```
// delete branch local
git branch -d nameBranchLocal

// delete branch remote
git push origin --delete nameBranchRemote

// squash commits
git rebase -i HEAD~quantityCommitsPrevious 
// or
git rebase -i commitId
```

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

