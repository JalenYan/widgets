require "test_helper"

Capybara.register_driver :root_headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.chrome(
    args: [
      "headless",
      "disable-gpu",
      "no-sandbox",
      "disable-dev-shm-usage",
      "whitelisted-ips"
    ],
    logging_prefs: {
      browser: "ALL"
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end # register_driver

require "support/with_clues"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include TestSupport::WithClues
  # driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
  driven_by :rack_test

  test "we can see a list of widgets and view one" do
    visit widgets_path

    widgets_name = "stembolt"
    widgets_name_regexp = /#{widgets_name}/i

    assert_selector "ul li", text: /flux capacitor/i
    assert_selector "ul li", text: widgets_name_regexp

    find("ul li", text: widgets_name_regexp).find("a").click

    # remember, 1234 is formatted as 12.34
    formatted_widget_id_regexp = /12\.34/

    assert_selector "[data-testid='widget-name']", text: widgets_name_regexp
    assert_selector "h2", text: formatted_widget_id_regexp
  end
end

# Base test class for system tests requiring JavaScript
class BrowserSystemTestCase < ApplicationSystemTestCase
  driven_by :root_headless_chrome, screen_size: [ 1400, 1400 ]
end
