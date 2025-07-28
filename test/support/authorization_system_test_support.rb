module TestSupport
  module AuthorizationSystem
    def login_as(user_factory_name)
      user = FactoryBot.create(user_factory_name)

      # Whatever else needed to log into your system as this user
    end

    def assert_no_access
      # assert whatever the UX is
      # for users being denied access
    end
  end
end
