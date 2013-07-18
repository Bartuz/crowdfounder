ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

DatabaseCleaner.strategy = :truncation

class ActiveSupport::TestCase
  
  teardown do 
    DatabaseCleaner.clean       # Erase what we put into the database during the tests
    Capybara.reset_sessions!    # Reset browser session
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end


  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting

  # Add more helper methods to be used by all tests here...
end
class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  # Crowdfunder is to be changed to the name of your app
  Capybara.app = Crowfounder::Application
end