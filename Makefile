login:
	bundle exec ruby titech_portal_auto_login.rb

build:
	gem install pit
	rbenv exec gem install bundler
	rbenv exec bundle install --path=vendor/bundle

build.macos:
	wget https://github.com/mozilla/geckodriver/releases/download/v0.14.0/geckodriver-v0.14.0-macos.tar.gz && tar -xf geckodriver-v0.14.0-macos.tar.gz  && mv geckodriver ./vendor/bundle/ruby/2.3.0/bin/ && rm geckodriver-v0.14.0-macos.tar.gz

build.linux64:
	wget https://github.com/mozilla/geckodriver/releases/download/v0.14.0/geckodriver-v0.14.0-linux64.tar.gz && tar -xf geckodriver-v0.14.0-linux64.tar.gz  && mv geckodriver ./vendor/bundle/ruby/2.3.0/bin/ && rm geckodriver-v0.14.0-linux.tar.gz

build.win64:
	wget https://github.com/mozilla/geckodriver/releases/download/v0.14.0/geckodriver-v0.14.0-win64.zip && tar -xf geckodriver-v0.14.0-win64.tar.gz && mv geckodriver ./vendor/bundle/ruby/2.3.0/bin/ && rm geckodriver-v0.14.0-win64.tar.gz
