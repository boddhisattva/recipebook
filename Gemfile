source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Used for integration with Contentful CMS
gem 'contentful_rails', '~> 0.5.0'

# To use Redis as a Cache store
gem 'redis', '~> 4.2', '>= 4.2.2'
# Speed up parsing multi bulk replies
gem 'hiredis'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # load environment variables in development environment
  gem 'dotenv-rails'
  # Useful for step-by-step debugging and stack navigation capabilities
  gem 'pry-byebug'
  # Behaviour Driven Development for Ruby
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Useful for ruby related linting
  gem 'rubocop', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # For integration and system testing purposes
  gem 'capybara', '~> 3.33'
  # Record one's test suite related HTTP interactions
  gem 'vcr', '~> 6.0'
  # Run Selenium tests more easily with automatic installation and updates for all supported webdrivers.
  gem 'webdrivers', '~> 4.4', '>= 4.4.1'
  # Stubbing and setting expectations on HTTP requests in Ruby.
  gem 'webmock', '~> 3.9', '>= 3.9.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
