# titech-portal-auto-login

An auto login script for [TokyoTech Portal](http://portal.titech.ac.jp/) .

# Requirement

- firefox
- [geckodriver](https://github.com/mozilla/geckodriver/releases)

# Install

```sh
$ make build
```

# SetUp

- make `env.rb`

```sh
$ touch env.rb
```

-  put your environmental information for tokyotech portal as below.

```ruby
@usr_name = YOUR_USER_NAME
@usr_password = YOUR_PASSWORD
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
