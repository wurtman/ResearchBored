ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

# Disable all remote HTTP request
require 'webmock/minitest'
WebMock.disable_net_connect!(allow_localhost: true)

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors) unless ENV["UNIT_COVERAGE_PLEASE"].present? || ENV["FUNCTIONAL_COVERAGE_PLEASE"].present?

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def connect_as(role)
    login = "test@example.com"
    password = "Mysecret+1234"
    account = Account.create!(email: login, password: password, status: "verified", role: role, profile: Profile.create!(name: "Under_Test")) 
    post '/login', params: { login: login, password: password }
    account
  end
  
end
