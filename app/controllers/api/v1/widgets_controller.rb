class Api::V1::WidgetsController < ApiController
  def show
    widget = Widget.find(params[:id])
    # Note that Rails automatically calls to_json for you
    render json: { widget: widget }
  end
end
