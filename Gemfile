source 'https://rubygems.org'

# Padrino supports Ruby version 2.2.2 and later
# ruby '2.5.3'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem 'activerecord', '>= 3.1', :require => 'active_record'
gem 'pg'

# Padrino Stable Gem
gem 'padrino', '0.14.4'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.14.4'
# end

gem 'grape'
gem 'grape-entity'
gem 'padrino-core', '0.14.4'
gem 'padrino-gen', '0.14.4'

group :development, :test do
  gem 'factory_girl'
  gem 'faker'
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'rspec'
  gem 'rack-test', :require => 'rack/test'
end


