# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# pin_all_from - 批量导入指定目录下的所有 JavaScript 文件
# "app/javascript/widget_rating" - 源目录路径
# under: "widget_rating" - 导入后的命名空间前缀
pin_all_from "app/javascript/widget_rating", under: "widget_rating"
