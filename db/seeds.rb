# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "deleting old instances"

Rent.destroy_all
Superpower.destroy_all
User.destroy_all

pic = [
"https://images.unsplash.com/photo-1583459094467-e0db130c0dea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1868&q=80",
"https://images.unsplash.com/photo-1537210249814-b9a10a161ae4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1789&q=80",
"https://images.unsplash.com/photo-1560698711-6df2370d7d62?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1503455876088-69e73d67c258?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1559825481-12a05cc00344?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1500575351013-6b9af18d7722?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1531134428421-397218356f00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1523624380983-bb4212fa8086?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1511447333015-45b65e60f6d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1502224562085-639556652f33?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1516832336751-adc31dc5b454?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1534224039826-c7a0eda0e6b3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1534175091487-530da38d9141?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1561053266-b6d206980123?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1563089144-ef7593d0183a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1563089145-599997674d42?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1593462442529-31c195b98136?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
]

puts "creating users"

admin = User.new
admin.email = "superdoom@lewagon.com"
admin.password = '123456'
admin.password_confirmation = '123456'
admin.save!

count = 0

15.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = 'xxxxxxxxxxssda'
  user.password_confirmation = 'xxxxxxxxxxssda'
  user.save!
    supower = Superpower.new
    supower.name = "#{Faker::Games::LeagueOfLegends.summoner_spell.upcase} #{Faker::Games::Pokemon.move.upcase}"
    supower.user_id = user.id
    supower.description = Faker::Games::LeagueOfLegends.quote
    supower.price = rand(1..200)
    supower.location = Faker::Address.country
    supower.pic = pic[count]
    count += 1
    supower.save!
      rand(1..3).times do
        Rent.create(date_from: Date.new, date_to: Date.new, superpower_id: supower.id, user_id: rand(1..20))
      end
end
puts "created superpowers"
puts "creating bookings"
puts "done, hf"
