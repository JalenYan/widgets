require "ostruct"

class WidgetsController < ApplicationController
  def show
    manufacturer = OpenStruct.new(
      id: rand(100),
      name: "Sector 7G",
      address: OpenStruct.new(
        id: rand(100),
        country: "CN"
      )
    )
    @widget = OpenStruct.new(
      id: params[:id],
      manufacturer_id: manufacturer.id,
      name: "Widget #{params[:id]}",
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
    @widgets = (1..10).map { |id| OpenStruct.new(id: id, manufacturer_id: rand(100), name: "Widget #{id}") }
  end
end
