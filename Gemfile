# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.0'

gem 'aasm' # State machine
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.1.3'
gem 'bootstrap4-kaminari-views' # Pagination design
gem 'coffee-rails', '~> 4.2'
gem 'comandor' # Action, Commands service object
gem 'email_address' # E-mail validation
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari' # Pagination
gem 'oga' # Nokogiri alternative for Parse and Search in XML, HTML documents
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails' # Slim view templates
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'awesome_print' # Nice print out for structures
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'annotate' # Annotate AR Models
  gem 'better_errors' # Nice Errors UI
  gem 'binding_of_caller' # Error path tracing
  gem 'bullet', '~> 5.0.0' # N+1 detection
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'ordinare', require: false # Sort Gemfile by order
  gem 'rubocop', require: false # Ruby code Linting
  gem 'rubocop-rspec', require: false # Rspec linting
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails' # Test framework
end
