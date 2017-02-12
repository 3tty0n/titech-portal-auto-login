# titech-portal-auto-login

An auto login script for [TokyoTech Portal](http://portal.titech.ac.jp/) .

# Requirement

- firefox

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

Create `env.rb`.

```sh
$ touch env.rb
```

Put your environmental information for Tokyo Tech portal in `env.rb` as below.

```ruby
@usr_name = 'YOUR_USER_NAME'
@usr_password = 'YOUR_PASSWORD'
@usr_matrix = {
  'A' => 'xxxxxxx',
  'B' => 'xxxxxxx',
  'C' => 'xxxxxxx',
  'D' => 'xxxxxxx',
  'E' => 'xxxxxxx',
  'F' => 'xxxxxxx',
  'G' => 'xxxxxxx',
  'H' => 'xxxxxxx',
  'I' => 'xxxxxxx',
  'J' => 'xxxxxxx'
}
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
$ titech
```
