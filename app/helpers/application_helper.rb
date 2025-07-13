module ApplicationHelper
  # html_safe 是告诉 Rails 这个字符串是安全的，可以被渲染为 HTML，不用被 escape
  # 但是，我们无法保证 widget_id 是安全的，所以这是个反面例子
  # “Thus, when authoring helpers,
  # never build strings using interpolation or concatenation.
  # Try to always use Rails’ helper methods to create your markup”
  def styled_widget_id(widget)
    %(
      <span style="font-family: monospace">
        #{widget.widget_id}
      </span>
    ).html_safe
  end
end
