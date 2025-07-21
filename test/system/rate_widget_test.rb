require "application_system_test_case"

class RateWidgetTest < BrowserSystemTestCase
  test "rate a widget shows our rating inline" do
    visit widget_path(1234)

    click_on "2"

    assert_selector "widget-rating [role=status]", text: /thanks for rating.*2/im
  end
end
