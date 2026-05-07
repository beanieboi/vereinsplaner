# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

require "simplecov"

SimpleCov.start "rails" do
  add_group "Policies", "app/policies"
end

Dir["#{File.dirname(__FILE__)}/helpers/**/*.rb"].each { |f| require f }

module ActiveSupport
  class TestCase
    include PunditHelper

    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

module ActionDispatch
  class IntegrationTest
    include LoginHelper
  end
end
