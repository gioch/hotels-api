source 'https://rubygems.org'

gem 'rails', '>= 5.0.0.rc1', '< 5.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rack-cors'
gem 'active_model_serializers'

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '3.5.0.beta1'
  gem 'rails-controller-testing', git: 'https://github.com/rails/rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'ffaker', '~> 2.1'
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
