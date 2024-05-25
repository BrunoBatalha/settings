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
    bgl = !git log --pretty=format:'%C(blue)%h %C(white)%s %C(red)%d - %C(cyan)%cn, %C(green)%cr'
    bglt = !git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'
```
### Mesclando dois repositórios com Git (sem perder commits)
```
git clone https://github.com/BrunoBatalha/Project.git
cd Project

git remote add repo2 https://github.com/BrunoBatalha/Project2.git
git fetch repo2
git checkout -b merge
git merge repo2/branchRepo2 --allow-unrelated-histories

// Resolva conflitos se necessário

git add .
git commit -m "Merge frontend and backend repositories"
git push origin merge
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

## ReactJs (Typescript)
### ESlint + Prettier  (não instale a extensão do prettier)

**.eslintrc.json**
``` json
{
    "env": {
        "browser": true,
        "es2021": true
    },
    "extends": [
        "plugin:react/recommended",
        "airbnb",
        "airbnb-typescript",
        "plugin:prettier/recommended",
        "plugin:@tanstack/eslint-plugin-query/recommended"
    ],
    "parser": "@typescript-eslint/parser",
    "parserOptions": {
        "ecmaFeatures": {
            "jsx": true
        },
        "ecmaVersion": "latest",
        "sourceType": "module",
        "project": "./tsconfig.json"
    },
    "plugins": [
        "react",
        "@typescript-eslint",
        "@tanstack/query"
    ],
    "rules": {
        "prettier/prettier": [
            "warn",
            {
              "singleQuote": true,
              "tabWidth": 2,
              "useTabs": false,
              "semi": true,
              "arrowParens": "always",
              "bracketSpacing": true,
              "printWidth": 120,
              "endOfLine": "lf",
              "trailingComma": "none"
            },
            {
              "usePrettierrc": false
            }
          ],
        "react/react-in-jsx-scope": "off",
        "react/jsx-props-no-spreading": "off",
        "react/function-component-definition": "off",
        "react/prop-types": "off",
        "react/jsx-no-useless-fragment": "off",
        "react/jsx-no-bind": "off",
        "import/prefer-default-export": "off",
        "no-param-reassign": "off",
        "react/require-default-props": "off",
        "react/no-array-index-key": "off",
        "@typescript-eslint/no-shadow": "off",
        "@typescript-eslint/no-use-before-define":  ["error", {
            "functions": false,
            "classes": true,
            "variables": true,
            "allowNamedExports": false
        }],
        "@typescript-eslint/no-unused-vars": [
            "warn",{
                "argsIgnorePattern": "^_",
                "varsIgnorePattern": "^_",
                "caughtErrorsIgnorePattern": "^_"
            }
        ]
    }
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

## NodeJs/NestJs (Typescript)
### ESLint + Prettier (não instale a extensão do prettier)
```
{
    "env": {
        "browser": true,
        "es2021": true
    },
    "extends": [
        "eslint:recommended",
        "plugin:@typescript-eslint/recommended",
        "plugin:prettier/recommended"
    ],
    "overrides": [
    ],
    "parser": "@typescript-eslint/parser",
    "parserOptions": {
        "ecmaVersion": "latest",
        "sourceType": "module"
    },
    "plugins": [
        "@typescript-eslint"
    ],
    "rules": {
        "no-console": "warn",
        "prettier/prettier": [
            "warn",
            {
              "singleQuote": true,
              "tabWidth": 2,
              "useTabs": false,
              "semi": true,
              "arrowParens": "always",
              "bracketSpacing": true,
              "printWidth": 120,
              "endOfLine": "auto",
              "trailingComma": "none"
            },
            {
              "usePrettierrc": false
            }
        ],
        "@typescript-eslint/no-namespace":"off",
        "@typescript-eslint/no-unused-vars": [
            "error",{
                "argsIgnorePattern": "^_",
                "varsIgnorePattern": "^_",
                "caughtErrorsIgnorePattern": "^_"
            }
        ],
        "@typescript-eslint/naming-convention": [
            "error",
            {
              "selector": ["variable", "function"],
              "format": ["camelCase"]
            },
            {
                "selector": ["class", "interface", "enum", "typeParameter"],
                "format": ["PascalCase"]
            }          
          ]
          
    }
}

```

**tsconfig.json**
```
{
  "compilerOptions": {
    "module": "commonjs",
    "declaration": true,
    "removeComments": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "allowSyntheticDefaultImports": true,
    "target": "ES2021",
    "sourceMap": true,
    "outDir": "./dist",
    "baseUrl": "./",
    "incremental": true,
    "skipLibCheck": true,
    "strictNullChecks": true,
    "noImplicitAny": true,
    "strictBindCallApply": false,
    "forceConsistentCasingInFileNames": false,
    "noFallthroughCasesInSwitch": false,
    "paths": {
     "@/*": ["./*"]
   }
  }
}
```

### Crie um arquivo .vscode/settings.json ou coloque na configuração do seu usuário mesmo
```
{
    "editor.codeActionsOnSave": [
        "source.addMissingImports",// optional
        "source.fixAll.eslint", // usa o eslint ao salvar
        "source.organizeImports", // optional
    ],
}
```

