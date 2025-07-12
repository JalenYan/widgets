# frozen_string_literal: true

class WigetRatingComponent < ViewComponent::Base
  attr_reader :widget, :show_cta

  def initialize(widget:, show_cta:)
    @widget = widget
    @show_cta = show_cta
  end
end
