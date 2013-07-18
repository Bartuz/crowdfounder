ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

DatabaseCleaner.strategy = :truncation

class ActiveSupport::TestCase
  
  

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting

  # Add more helper methods to be used by all tests here...
end
class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
teardown do 
    DatabaseCleaner.clean       # Erase what we put into the database during the tests
    Capybara.reset_sessions!    # Reset browser session
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end

  # Crowdfunder is to be changed to the name of your app
  Capybara.app = Crowfounder::Application
  Capybara.javascript_driver = :webkit
   self.use_transactional_fixtures = false 
  def setup_signed_in_user
    pass = "this-is-a-password"
    user = FactoryGirl.create :user, password: pass
    visit '/session/new'

    fill_in "email", with: user.email
    fill_in "password", with: pass
    click_button "Login"

    # No asserts because testing is not done inside of a helper method
  end
end