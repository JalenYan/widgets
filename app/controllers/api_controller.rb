class ApiController < ApplicationController
  before_action :authenticate
  before_action :require_json

  private

  def authenticate
    # Authorization: Token <key>
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.find_by(key: token, deactivated_at: nil).present?
    end
  end

  def require_json
    if !request.format.json?
      head :not_acceptable
    end
  end
end
