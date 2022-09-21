# How to setup linting

Prettier is used to automatically perform code formatting. ESLint performs code style checks.

## Installing ESLint

Add ESLint as a development dependency

```shell
yarn add -D eslint
```

ESLint requires a configuration file to run. Create a config file with

```shell
yarn eslint --init
```

Initial settings:

```shell
✔ How would you like to use ESLint? · style
✔ What type of modules does your project use? · esm
✔ Which framework does your project use? · react
✔ Does your project use TypeScript? · Yes
✔ Where does your code run? · node
✔ How would you like to define a style for your project? · guide
✔ Which style guide do you want to follow? · airbnb
✔ What format do you want your config file to be in? · JSON
✔ Which package manager do you want to use? · yarn
```

See `.eslintrc.json` for most updated settings

## Installing Prettier

Add Prettier as development dependency

```shell
yarn add -D prettier eslint-config-prettier eslint-plugin-prettier
```

## Running ESLint + Prettier

To run Prettier to update file:

```shell
yarn prettier -w src/
```

# Lint using Git hooks

Git hooks allow scripts to execute on Git commits or push.

- [Husky](https://github.com/typicode/husky) is used to lint and format files, run tests, etc.

- [lint-staged](https://github.com/okonet/lint-staged#why) ensures staged Git files are following code style.

`lint-staged` will execute commands (e.g. eslint & prettier) on files that are ready to be committed. Before that is possible, `husky` triggers lint-staged on pre-commit using Git hooks.

## Install

Install `husky` , `lint-staged` as devDependencies.

```shell
yarn add -D husky lint-staged
```

## Configure lint-staged

Modify `package.json` by adding a lint-staged section as so:

```json
"lint-staged": {
    "*.{js,jsx,ts,tsx}": [
      "eslint --fix",
      "prettier --write"
    ],
    "*.{json,md}": [
      "prettier --write"
    ]
}
```

lint-staged will execute those commands on files that are ready to be committed.

## Configure Husky

Create `.husky` directory with

```shell
yarn prepare
```

A pre-commit hook is configured using

```shell
yarn husky add .husky/pre-commit "yarn lint-staged"
```
