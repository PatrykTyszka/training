source 'https://rubygems.org'
ruby '2.1.5'

# General
gem 'rails', '4.1.8'
gem 'slim-rails', '2.1.5'
gem 'ejs', '1.1.1'
gem 'tilt-jade', '1.2.0'
gem 'pg', '0.17.1'
gem 'active_model_serializers', '0.9.2'

# Frontend
gem 'sass-rails', '5.0.1'
gem 'compass-rails', '2.0.4'
gem 'coffee-rails', '4.1.0'
gem 'jquery-rails', '3.1.2'
gem 'jquery-ui-rails', '5.0.3'
gem 'uglifier', '2.4.0'
gem 'compass-blueprint', '1.0.0'
gem 'js-routes', '0.9.9'
gem 'gon', '~> 5.2.3'

# Authentication
gem 'devise', '3.3.0'
gem 'omniauth', '1.2.2'
gem 'omniauth-github', '1.1.2'


group :development, :test do
  gem 'byebug', '3.5.1'
  gem 'web-console', '2.0.0'
  gem 'thin', '1.6.3'
  gem 'quiet_assets', '1.0.3'
  gem 'fontello_rails_converter', '0.3.2'
end

group :test do
  gem 'database_cleaner', '1.3.0'
  gem 'rspec-rails', '3.1.0'
  gem 'rspec-sidekiq', '2.0.0'
  gem 'factory_girl_rails', '4.5.0'
  gem 'simplecov', '0.9.1'
  gem 'simplecov-rcov', '0.2.3'
  gem 'ci_reporter_rspec', '1.0.0'
  gem 'webmock', '1.20.4'
  gem 'shoulda-matchers', '2.7.0', require: false
end

group :doc do
  gem 'sdoc', '0.4.1', group: :doc
end

group :staging, :production do
  gem 'rails_12factor', '0.0.3'
end
