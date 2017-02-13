# titech-portal-auto-login

An auto login script for [TokyoTech Portal](http://portal.titech.ac.jp/) .

# Requirements

- firefox
- rbenv
- [pit](https://github.com/cho45/pit)

# Install

First:

```sh
$ make
```

Next, if you use macOS:

```sh
$ make build.macos
```

If you use linux64:

```sh
$ make build.linux64
```

If you use win64:

```sh
$ make build.win64
```

# Setup

Put your environmental information for Tokyo Tech portal as below.

```sh
$ vi ~/.pit/default.yaml
titech:
  usr_name: YOUR_USER_NAME
  usr_password: YOUR_PASSWORD
  usr_matrix: ['xxxxxxx', 'xxxxxxx', 'xxxxxxx', 'xxxxxxx', 'xxxxxxx', 'xxxxxxx', 'xxxxxxx', 'xxxxxxx', 'xxxxxxx', 'xxxxxxx']
```

# Usage

```sh
$ make login
```

# Further Option

You can log in Tokyo Tech Portal by this command to create it:

```sh
$ vi /usr/local/bin/titech
cd /path/to/titech-portal-auto-login
make login
$ chmod +x /usr/local/bin/titech
$ titech
```
