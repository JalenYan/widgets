require "ostruct"

class WidgetsController < ApplicationController

  def new
    @widget = Widget.new
    @manufacturers = Manufacturer.all
    @widget.errors.add(:name,           :blank)
    @widget.errors.add(:manufacturer_id,:blank)
    @widget.errors.add(:price_cents,    :not_a_number)
  end

  def create
    render plain: "Thanks"
  end

  def show
    manufacturer = OpenStruct.new(
      id: rand(100),
      name: "Sector 7G",
      address: OpenStruct.new(
        id: rand(100),
        country: "CN"
      )
    )

    widget_name = params[:id].to_i == 1234 ? "Stembolt" : "Widget #{params[:id]}"

    @widget = OpenStruct.new(
      id: params[:id],
      manufacturer_id: manufacturer.id,
      name: widget_name,
      manufacturer: manufacturer
    )

    # 因为现在还没有 widget 类，所以这样演示
    def @widget.widget_id
      if self.id.to_s.length < 3
        self.id.to_s
      else
        self.id.to_s[0..-3] + "." + self.id.to_s[-2..-1]
      end
    end
  end

  def index
    @widgets = [
      OpenStruct.new(id: 1234, name: "Stembolt"),
      OpenStruct.new(id: 2, name: "Flux Capacitor")
    ]
  end
end
