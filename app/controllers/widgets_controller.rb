require "ostruct"

class WidgetsController < ApplicationController
  def show
    @widget = OpenStruct.new(id: params[:id], manufacturer_id: rand(100), name: "Widget #{params[:id]}")
  end

  def index
    @widgets = (1..10).map { |id| OpenStruct.new(id: id, manufacturer_id: rand(100), name: "Widget #{id}") }
  end
end
