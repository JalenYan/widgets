class HighPricedWidgetCheckJob < ApplicationJob
  def perform(widget_id, original_price_cents)
    if original_price_cents > 7_500_00
      WidgetCreator.new.high_priced_widget_check(
        widget_id,
        original_price_cents
      )
    end
  end
end
