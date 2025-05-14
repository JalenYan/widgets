class WidgetRatingsController < ApplicationController
  def create
    if params[:widget_id]
      # find the widget
      # update its rating
      redirect_to widget_path(params[:widget_id]),
        notice: "Widget rating created successfully"
    else
      head :bad_request
      # head 是一个快捷方式，用于只返回 HTTP 状态码和响应头，不返回内容
      # head :ok             # 返回 200 OK，无内容
      # head :not_found      # 返回 404 Not Found
      # head :unauthorized   # 返回 401 Unauthorized
      # head :forbidden      # 返回 403 Forbidden
      # head :no_content     # 返回 204 No Content
    end
  end
end
