class Api::WidgetsController < ApiController
  def show
    widget = Widget.find(params[:id])
    render json: { widget: widget }
  end
end
