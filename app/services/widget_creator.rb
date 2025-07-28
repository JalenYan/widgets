class WidgetCreator
  def create_widget(widget)
    widget.widget_status = WidgetStatus.find_by(name: "Fresh")
    widget.save

    if widget.invalid?
      return Result.new(created: false, widget: widget)
    end

    HighPricedWidgetCheckJob.perform_async(
      widget.id, widget.price_cents
    )
    # Note that we are calling to_s on created_at.
    # Sidekiq cannot correctly serialize a DateTime
    # and will emit a warning if we don’t serialize it explicitly.
    WidgetFromNewManufacturerCheckJob.perform_async(
      widget.id, widget.manufacturer.created_at.to_s
    )

    Result.new(created: widget.valid?, widget: widget)
  end

  def high_priced_widget_check(widget_id, original_price_cents)
    if original_price_cents > 7_500_00
      widget = Widget.find(widget_id)
      FinanceMailer.high_priced_widget(widget).deliver_now
    end
  end

  def widget_from_new_manufacturer_check(
    widget_id, original_manufacturer_created_at)
    if original_manufacturer_created_at.after?(60.days.ago)
      widget = Widget.find(widget_id)
      AdminMailer.new_widget_from_new_manufacturer(widget).
        deliver_now
    end
  end

  class Result
    attr_reader :widget
    def initialize(created:, widget:)
      @created = created
      @widget = widget
    end

    def created?
      @created
    end
  end
end
