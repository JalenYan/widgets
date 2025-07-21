// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import { Turbo } from "@hotwired/turbo-rails"

// The default of 500ms is too long and
// user can lose the causal link between clicking
// a link and seeing the browser respond.
Turbo.config.drive.progressBarDelay = 100

import WidgetRatingButtons from "widget_rating"

// 为什么要在 DOMContentLoaded 事件中定义自定义Web组件？
// 1. 确保DOM内容可访问性
// 自定义元素需要访问其内部内容。如果在DOM完全加载之前就定义元素，那些需要的HTML内容可能还不存在，会导致组件无法正常工作。
// 2. 避免时序问题
// 通过等待 DOMContentLoaded 事件，确保：所有HTML已解析完成，自定义元素可以找到并操作其预期的DOM结构，避免因过早定义而导致的初始化失败
// 3. 防止重复定义，不使用 turbo:load（Turbo框架的事件），因为：turbo:load 在单页应用中可能多次触发，重复调用 customElements.define() 会抛出错误，DOMContentLoaded 在每次页面加载时只触发一次
document.addEventListener("DOMContentLoaded", () => {
    customElements.define("widget-rating", WidgetRatingButtons)
})
