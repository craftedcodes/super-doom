# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "creating users"

20.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = 'xxxxxxxxxxssda'
  user.password_confirmation = 'xxxxxxxxxxssda'
  user.save!
end

puts "creating superpowers"

50.times do
  supower = Superpower.new
  supower.name = "#{Faker::Games::LeagueOfLegends.summoner_spell} #{Faker::Games::Pokemon.move}"
  supower.user_id = rand(1..20)
  supower.description = Faker::Games::LeagueOfLegends.quote
  supower.price = rand(1..200)
  supower.location = Faker::Address.country
  supower.save!
end



puts "creating bookings"

250.times do
  power_id = rand(1..200)
  Rent.create(date_from: Date.new, date_to: Date.new, superpower_id: power_id, user_id: rand(1..20))
end

puts "done, hf"
