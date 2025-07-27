require "test_helper"

class WidgetsControllerTest < ActionDispatch::IntegrationTest
  test "converts dollars to cents when creating widget" do
    manufacturer = FactoryBot.create(:manufacturer)
    FactoryBot.create(:widget_status, name: "Fresh")

    post widgets_url, params: {
      widget: {
        name: "Test Widget",
        price_cents: "123.45",
        # 前端传入的所有数据都是字符串，测试时保持一致
        manufacturer_id: manufacturer.id.to_s
        # 错误示例
        # manufacturer: manufacturer
      }
    }

    widget = Widget.last
    confidence_check do
      refute_nil widget
      assert_redirected_to widget_url(widget)
    end

    assert_equal 12345, widget.price_cents
  end
end
