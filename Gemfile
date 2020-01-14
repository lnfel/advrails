source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '6.0.1'
# Use Puma as the app server
gem 'puma', '4.3.1'
# Use SCSS for stylesheets
gem 'sass-rails', '6.0.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.9.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.4.5', require: false
# Bootstrap
gem 'bootstrap', '4.4.1'
# Font-awesome
gem 'font-awesome-sass', '5.12'
# JQuery
gem 'jquery-rails', '4.3.5'
# Devise
#gem 'devise', '4.7.1'
# Active Storage
# Don't use mini_magick 4.5 due to high severity issue
gem 'mini_magick', '4.9.4'

group :development, :test do
	# Use sqlite3 as the database for Active Record
	gem 'sqlite3', '1.4.1'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Mailcatcher
  #gem 'mailcatcher'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '4.0.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '3.29.0'
  gem 'selenium-webdriver', '3.142.6'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '4.1.3'
end

group :production do
	gem 'pg', '1.1.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
