ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
Capybara.configure do |config|
  # This allows helpers like click_on to locate
  # any object by data-testid in addtion to
  # built-in selector-like values
  #
  # example:
  # <button data-testid="submit-button">提交</button>
  # <div data-testid="error-message">错误信息</div>
  # click_on "submit-button"           # 通过 data-testid 定位
  # assert_selector "error-message"    # 通过 data-testid 定位
  config.test_id = "data-testid"
end

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
