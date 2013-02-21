source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# TEST ONLY PER SCREENCAST?
gem 'simplecov', '0.7.1', :require => false, :group => :test


# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  # Add :require => false as per screencast 6.8.1?
#  gem 'simplecov', :require => false
  gem 'ZenTest'  # For autotest, per screencast.
end
group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # therubyracer + simpleconv => cucumber problems.
  # See http://stackoverflow.com/questions/9863200/cucumber-claims-its-support-files-are-broken
  # There may be a better fix, but it's not worth the time.
  # Crap, now the auto-grader's complaining about no js runtime.  Let's put it back in.
  gem 'therubyracer', '0.10.2'              
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'
