source 'https://rubygems.org'
ruby '2.6.3'

gem 'bootsnap', require: false
gem 'devise'
gem 'jbuilder', '~> 2.0'
gem 'pg', '~> 0.21'
gem 'puma'
gem 'rails', '6.0.2.1'
gem 'redis'
gem 'active_storage_validations'
gem 'bootstrap-email'
gem 'autoprefixer-rails'
gem 'font-awesome-sass', '~> 5.12.0'
gem 'sassc-rails'
gem 'simple_form'
gem 'uglifier'
gem 'webpacker'
gem 'money-rails', '~>1.12'
gem 'cloudinary', '~> 1.12.0'
gem 'pg_search'
gem 'stripe'
gem 'httparty'
gem 'geocoder'
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
gem 'stripe_event'
gem "pundit"
gem "letter_opener", :group => :development

group :development do
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'capybara'
  gem 'webdrivers', '~> 4.0'
  gem 'launchy'
  gem 'database_cleaner-active_record'
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
      gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'master' # Previously '4-0-dev' or '4-0-maintenance' branch
    end
    gem 'listen', '~> 3.0.5'
    gem 'spring'
    gem "factory_bot_rails"
    gem 'spring-watcher-listen', '~> 2.0.0'
    gem 'dotenv-rails'
  end
