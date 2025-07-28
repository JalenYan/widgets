require "test_helper"

class Api::V1::WidgetsTest < ActionDispatch::IntegrationTest
  test "get a widget" do
    api_key = FactoryBot.create(:api_key)
    authorization = ActionController::
                      HttpAuthentication::
                        Token.encode_credentials(api_key.key)

    widget = FactoryBot.create(:widget)

    get api_v1_widget_path(widget),
      headers: {
        "Accept" => "application/json",
        "Authorization" => authorization
      }

    assert_response :success

    parsed_response = JSON.parse(response.body)

    refute_nil parsed_response["widget"]

    assert_equal widget.id, parsed_response.dig("widget", "id")
    assert_equal widget.name, parsed_response.dig("widget", "name")
    assert_equal widget.price_cents, parsed_response.dig("widget", "price_cents")
    assert_equal widget.user_facing_identifier, parsed_response.dig("widget", "user_facing_identifier")
    assert_equal widget.widget_status.name, parsed_response.dig("widget", "widget_status", "name")
  end
end
