module OneOff
  class WidgetPricing
    def change_to_95_cents
      Widget.find_each do |widget|
        # Whatever logic is needed to update the price
      end
    end
  end
end
