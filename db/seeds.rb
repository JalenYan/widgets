# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if !Rails.env.development?
  puts "[ db/seeds.rb ] Seed data is for development only, " +
       "not #{Rails.env}"
  exit 0
end

require "factory_bot"

Widget.destroy_all
Manufacturer.destroy_all
Address.destroy_all
WidgetStatus.destroy_all

puts "[ db/seeds.rb ] Creating development data..."
FactoryBot.create(:widget_status, name: "Fresh")
10.times do
  FactoryBot.create(:manufacturer)
end
cyberdyne = FactoryBot.create(:manufacturer,
                              name: "Cyberdyne Systems")
FactoryBot.create(:widget, name: "Stembolt",
                           manufacturer: cyberdyne)
puts "[ db/seeds.rb ] Done"
