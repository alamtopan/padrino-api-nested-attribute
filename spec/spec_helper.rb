RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))

RSpec.configure do |conf|
  conf.include Rack::Test::Methods

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :active_record
    end
  end

  conf.include(Shoulda::Matchers::ActiveModel, type: :model)
  conf.include(Shoulda::Matchers::ActiveRecord, type: :model)

  conf.before(:each) do
    DatabaseCleaner[:active_record].strategy = :transaction
  end

  conf.before(:each) do
    DatabaseCleaner[:active_record].start
  end

  conf.after(:each) do
    DatabaseCleaner[:active_record].clean
  end
end

# You can use this method to custom specify a Rack app
# you want rack-test to invoke:
#
#   app CustomProject::App
#   app CustomProject::App.tap { |a| }
#   app(CustomProject::App) do
#     set :foo, :bar
#   end
#
def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end
