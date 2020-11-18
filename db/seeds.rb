# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "creating users"

10.times do
  User.create(email: Faker::Internet.email, encrypted_password: "asdhaslh")
end

puts "creating superpowers"

20.times do
  name = Faker::Games::LeagueOfLegends.summoner_spell
  description = Faker::Games::LeagueOfLegends.quote
  price = 1
  address = Faker::Address.country
  Superpower.create(name: name, description: description, user_id: rand(1..10), price: price, location: address)
end

puts "created superpowers"

puts "creating bookings"

25.times do
  power_id = rand(1..22)
  Rent.create(date_from: Date.new, date_to: Date.new, superpower_id: power_id, user_id: 1)
end

puts "created bookings"
