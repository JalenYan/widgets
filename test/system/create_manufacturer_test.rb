require "application_system_test_case"
require "support/authorization_system_test_support"

class CreateManufacturerTest < ApplicationSystemTestCase
  include TestSupport::AuthorizationSystem

  test "only admins can create manufacturers" do
    # login_as(:non_admin)

    # attempt to create a manufacturer

    # assert_no_access
  end
end
