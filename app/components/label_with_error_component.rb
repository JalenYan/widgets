# frozen_string_literal: true

class LabelWithErrorComponent < ViewComponent::Base
  attr_reader :record, :field_name, :form

  def initialize(record:, field_name:, form:)
    @record = record
    @field_name = field_name
    @form = form
  end
end
