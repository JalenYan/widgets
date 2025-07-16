require "ostruct"
class DesignSystemDocsController < ApplicationController
  def index
    @design_system_docs = OpenStruct.new(
      font_sizes: [
        "f-1",
        "f-2",
        "f-3",
        "f-4"
      ],
      spacings: [ 1, 2, 3, 4 ],
      colors: {
        text: "black",
        red:  "red",
        blue: "blue"
      }
    )
  end
end
