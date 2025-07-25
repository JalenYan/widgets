require "application_system_test_case"

class CreateWidgetTest < BrowserSystemTestCase
  def setup
    FactoryBot.create(:widget_status, name: "Fresh")
  end

  test "we can create a widget" do
    manufacturer = FactoryBot.create(:manufacturer)
    other_manufacturer = FactoryBot.create(:manufacturer)

    visit new_widget_path

    fill_in "widget[name]", with: "Stembolt"
    fill_in "widget[price_cents]", with: "123"
    select manufacturer.name, from: "widget[manufacturer_id]"

    click_on "Create"

    assert_selector "[data-testid='widget-name']", text: "Stembolt"
    assert_equal 123_00, Widget.last.price_cents
  end

  test "we can see validation errors" do
    visit new_widget_path

    click_on("Create")

    assert_text "The data you provided is not valid"

    with_clues do
      assert_text "Name can't be blank"
      assert_text "Price is not a number"
      assert_text "Manufacturer can't be blank"
    end
  end
end
