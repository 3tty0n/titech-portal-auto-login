# titech-portal-auto-login

An auto login script for [TokyoTech Portal](http://portal.titech.ac.jp/) .

# Requirement

- firefox
- [geckodriver](https://github.com/mozilla/geckodriver/releases)
  - Please install it in `./vendor/bundle/ruby/2.3.0/bin`

# Install

```sh
$ make build
```

# Setup

- make `env.rb`

```sh
$ touch env.rb
```

-  put your environmental information for Tokyo Tech portal in `env.rb` as below.

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
