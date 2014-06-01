source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.1'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'

gem 'spring',        group: :development

gem 'thin'

group :development, :test do
  gem 'pry'
  gem 'sqlite3'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', require: false
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end
