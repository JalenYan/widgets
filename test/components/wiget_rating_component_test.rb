# frozen_string_literal: true

require "test_helper"
require "ostruct"

class WigetRatingComponentTest < ViewComponent::TestCase
  def test_show_cta
    render_inline(WigetRatingComponent.new(widget: OpenStruct.new(id: 1), show_cta: true))
    assert_text "Your ratings helps us be amazing!"
  end

  def test_no_cta
    render_inline(WigetRatingComponent.new(widget: OpenStruct.new(id: 1), show_cta: false))
    assert_no_text "Your ratings helps us be amazing!"
  end
end
