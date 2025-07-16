// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import { Turbo } from "@hotwired/turbo-rails"

// The default of 500ms is too long and
// user can lose the causal link between clicking
// a link and seeing the browser respond.
Turbo.config.drive.progressBarDelay = 100
