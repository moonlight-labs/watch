# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
  ActiveSupport::TestCase.fixtures :all
end

require 'wrong'
require "minitest/rails"
require "minitest/pride"
require "minitest/reporters"
require 'faker'



class ActiveSupport::TestCase
  include Wrong

  Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
  ActiveRecord::Migration.check_pending!
  fixtures :all

end

if ActionDispatch::IntegrationTest.method_defined?(:fixture_path=)
  ActionDispatch::IntegrationTest.fixture_path = File.expand_path("../fixtures", __FILE__)
end

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"



# class ActionController::TestCase
#   include Devise::TestHelpers
#   def create_user_and_login(email: "user@example.com", password: "isaac1sloan")
#     u = User.create(email: email, password: password, password_confirmation: password)
#     sign_in(u) 
#   end
# end