require "test_helper.rb"

class Api::AuthenticationTest < ActionDispatch::IntegrationTest
  test "without an API key, we get a 401" do
    widget = FactoryBot.create(:widget)

    get api_v1_widget_path(widget),
      headers: {
        "Accept" => "application/json"
      }

    assert_response 401
  end

  test "with a non-existent API key, we get a 401" do
    authorization = ActionController::
                      HttpAuthentication::
                        Token.encode_credentials("not real")

    widget = FactoryBot.create(:widget)

    get api_v1_widget_path(widget),
      headers: {
        "Accept" => "application/json",
        "Authorization" => authorization
      }

    assert_response 401
  end

  test "with a deactivated API key, we get a 401" do
    api_key = FactoryBot.create(:api_key,
                                deactivated_at: Time.zone.now)
    authorization = ActionController::
                      HttpAuthentication::
                        Token.encode_credentials(api_key.key)

    widget = FactoryBot.create(:widget)

    get api_v1_widget_path(widget),
      headers: {
        "Accept" => "application/json",
        "Authorization" => authorization
      }

    assert_response 401
  end
end
