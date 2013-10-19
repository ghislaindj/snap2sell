source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'


# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem "debugger"
  gem "awesome_print"
  gem "capistrano"
  gem 'rvm-capistrano'
end

group :production, :staging do
  gem 'unicorn'
  gem 'execjs'
  gem 'therubyracer'
end

#Mongoid
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem "mongoid", git: "https://github.com/mongoid/mongoid.git"
#end

gem "rails_config"

gem 'github_api'