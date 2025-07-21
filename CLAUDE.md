# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Rails Application Commands
```bash
# Start the development server
bin/dev

# Start Rails server only (without additional services)
bin/rails server

# Database operations
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
bin/rails db:reset    # Drop, create, migrate, and seed

# Rails console
bin/rails console
```

### Testing Commands
```bash
# Run all unit tests
bin/rails test

# Run system tests (browser-based)
bin/rails test:system

# Run complete CI pipeline locally
bin/ci

# Run specific test file
bin/rails test test/models/user_test.rb

# Run tests with database reset
bin/rails test:db
```

### Code Quality Commands
```bash
# Security vulnerability scanning
bin/brakeman

# Code style checking
bin/rubocop

# Gem security audit
bundle audit check --update

# JavaScript asset auditing
bin/importmap audit

# JavaScript asset building
yarn build
```

## Application Architecture

### Core Structure
This is a Ruby on Rails 8.0 application with the following key components:

- **Rails 8.0** with modern defaults
- **PostgreSQL** database
- **Tailwind CSS** for styling
- **Turbo & Stimulus** for frontend interactivity
- **Solid Queue** for background jobs
- **Solid Cache** for caching
- **Action Cable** for real-time features

### Key Models & Relationships
```
```

## Function Design Principles

### 1. Resource-Oriented Design
- **RESTful Routing**: Use standard Rails resource routing
- **Resource Naming**: Use clear and consistent resource naming
- **URL Design**: Maintain predictability in URL structure

```ruby
# Good resource design
resources :user_shipping_estimates, only: [:index, :show]

# Avoid non-RESTful custom actions
# resources :widgets do
#   member do
#     post :do_something_weird
#   end
# end
```

### 2. Layered Architecture Principles

#### Controller Layer: Configuration, Not Logic
```ruby
class WidgetsController < ApplicationController
  def create
    # Do only three things: receive input, call business logic, organize output
    result = WidgetCreator.new.call(widget_params)

    if result.success?
      redirect_to widget_path(result.widget)
    else
      @widget = result.widget
      render :new
    end
  end

  private

  def widget_params
    params.require(:widget).permit(:name, :description)
  end
end
```

#### Model Layer: Data and Simple Domain Logic
- additional configuration such as belongs_to or validates.
- class methods that query the database and are needed by multiple other classes to reduce duplication.
- instance methods that define core domain attributes whose values can be directly derived from the database, without the application of business logic.

```ruby
class Widget < ApplicationRecord
  # Contains only data access and simple domain logic
  validates :name, presence: true

  def user_facing_identifier
    # User-facing ID format is a domain concept
    id_as_string = self.id.to_s
    return id_as_string if id_as_string.length < 3

    "#{id_as_string[0..-3]}.#{id_as_string[-2..-1]}"
  end
end
```

#### Service Layer: Complex Business Logic
```ruby
class WidgetCreator
  def call(params)
    widget = Widget.new(params)

    if widget.valid?
      widget.save!
      NotificationJob.perform_later(widget.id)
      Result.success(widget: widget)
    else
      Result.failure(widget: widget, errors: widget.errors)
    end
  end

  private

  class Result
    attr_reader :widget, :errors

    def initialize(success:, widget:, errors: nil)
      @success = success
      @widget = widget
      @errors = errors
    end

    def success?
      @success
    end

    def self.success(widget:)
      new(success: true, widget: widget)
    end

    def self.failure(widget:, errors:)
      new(success: false, widget: widget, errors: errors)
    end
  end
end
```

### 3. Business Logic Organization

#### Do Not Place Business Logic in Active Record
- **Active Record Responsibilities**: Data access and simple data-related logic
- **Service Layer Responsibilities**: Complex business processes and application logic
- **Domain Objects**: Use Active Model to create non-persisted domain objects

```ruby
# Use Active Model to create domain objects
class UserShippingEstimate
  include ActiveModel::Model

  attr_accessor :widget_name, :widget_user_facing_id,
                :shipping_zone, :destination_post_code

  def persisted?
    true
  end

  def to_key
    [widget_user_facing_id, destination_post_code]
  end
end
```

# important-instruction-reminders
Do what has been asked; nothing more, nothing less.
NEVER create files unless they're absolutely necessary for achieving your goal.
ALWAYS prefer editing an existing file to creating a new one.
NEVER proactively create documentation files (*.md) or README files. Only create documentation files if explicitly requested by the User.
