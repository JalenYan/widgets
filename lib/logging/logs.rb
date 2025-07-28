module Logging
  module Logs
    def log(message_or_object, message = nil)
      request_id = Current.request_id
      message = if message.nil?
        message_or_object
      else
        object = message_or_object
        if object.respond_to?(:id)
          "(#{object.class}/#{object.id}) #{message}"
        else
          "(#{object.class}/#{object}) #{message}"
        end
      end
      # log widget, "updated"
      # => request_id: 1caebeaf [WidgetCreator] (Widget/1234) updated
      Rails.logger.info("[#{self.class}] " \
                        "request_id:#{request_id} " \
                        "#{message}")
    end
  end
end
