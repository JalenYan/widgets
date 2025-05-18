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
  end

  def index
    @widgets = (1..10).map { |id| OpenStruct.new(id: id, manufacturer_id: rand(100), name: "Widget #{id}") }
  end
end
