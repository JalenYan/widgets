class Api::V1::WidgetsController < ApiController
  def show
    widget = Widget.find(params[:id])
    render json: { widget: widget }
  end
end
