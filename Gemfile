source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.4.1'
gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'faraday'
gem 'fast_jsonapi'
gem 'bcrypt'
gem 'rack-cors', require: 'rack/cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'figaro'
  gem 'pry'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~>3.1'
  gem 'simplecov'
  gem 'vcr'
  gem 'webmock'

end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
