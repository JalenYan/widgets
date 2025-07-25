module ApplicationHelper
  # When authoring helpers,
  # never build strings using interpolation or concatenation.
  # Try to always use Rails’ helper methods to create your markup
  def styled_widget_id(widget)
    content_tag(:span, widget.user_facing_identifier.to_s.rjust(7, "0"), style: "font-family: monospace")
  end
end
