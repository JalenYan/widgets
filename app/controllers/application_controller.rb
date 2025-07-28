class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_request_id

  def set_current_request_id
    Current.request_id = request.request_id
  end

  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.request_id
  end
end
