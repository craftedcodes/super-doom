# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating superpowers"

20.times do
  name = Faker::Games::LeagueOfLegends.summoner_spell
  description = Faker::Games::LeagueOfLegends.quote
  price = rand(1..100)
  address = Faker::Address.country
  Superpower.create(name: name, description: description, user_id: 1, price: price, location: address)
end

puts "created superpowers"