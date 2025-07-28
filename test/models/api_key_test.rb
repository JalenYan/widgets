require "test_helper"

class ApiKeyTest < ActiveSupport::TestCase
  test "client cannot have more than one active key" do
    ApiKey.create!(
      key: SecureRandom.uuid,
      client_name: "Acme, Inc."
    )

    exception = assert_raises do
      ApiKey.create!(
        key: SecureRandom.uuid,
        client_name: "Acme, Inc."
      )
    end

    assert_match(/duplicate key.*violates unique constraint/i,
                 exception.message)
  end

  test "client can have more than one key if all but one is deactivated" do
    ApiKey.create!(
      key: SecureRandom.uuid,
      client_name: "Acme, Inc.",
      deactivated_at: 1.day.ago
    )

    ApiKey.create!(
      key: SecureRandom.uuid,
      client_name: "Acme, Inc."
    )
  end
end
