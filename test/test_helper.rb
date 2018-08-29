ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include FactoryBot::Syntax::Methods
  include Devise::Test::IntegrationHelpers
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def login_user
  	post user_sessions_path, params: {
  		email: users(:miguel).email, password: 'miguel'
  	}
  end

  def logout_user
  	delete destroy_user_sessions_path
  end
end
