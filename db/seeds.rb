# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Reservation.destroy_all
Lodging.destroy_all
City.destroy_all
User.destroy_all

20.times do
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph(sentence_count: 2), phone_number: "0#{rand(1..9)} #{rand(1..9)}#{rand(1..9)} #{rand(1..9)}#{rand(1..9)} #{rand(1..9)}#{rand(1..9)} #{rand(1..9)}#{rand(1..9)}")
  user.email = "#{user.first_name.downcase}.#{user.last_name.downcase}@#{["goooogle.com","oraaange.fr","yahoooo.com"].sample(1).first}"
  user.save
end

[{name: "Paris", zip_code: "75000"},{name: "Lyon", zip_code: "69000"},{name: "Lille", zip_code: "59000"},{name: "Toulouse", zip_code: "31000"},{name: "Marseille", zip_code: "13000"},{name: "Bordeaux", zip_code: "33000"},{name: "Clermont-Ferrand", zip_code: "63000"},{name: "Le Havre", zip_code: "76000"},{name: "Brest", zip_code: "29000"},{name: "Nantes", zip_code: "44000"}].each do |current|
  City.create(name: current[:name], zip_code: current[:zip_code])
end

50.times do
  Lodging.create(available_beds: rand(1..12), price: rand(40..400), description: Faker::Lorem.paragraph_by_chars(number: rand(141..300)), welcome_message: Faker::Lorem.paragraph(sentence_count: 2), city: City.all.sample(1).first, administrator: User.all.sample(1).first, has_wifi: [true, false].sample(1).first)
end

while Reservation.all.length < 5
  reservation = Reservation.new(start_date: Faker::Date.backward(days: 365), lodging: Lodging.all.sample(1).first)
  reservation.guest = User.all.reject {|user| user.id == reservation.lodging.administrator_id}.sample(1).first
  reservation.end_date = reservation.start_date + rand(1..30).day
  reservation.save
end

while Reservation.all.length < 10
  reservation = Reservation.new(start_date: Faker::Date.forward(days: 365), lodging: Lodging.all.sample(1).first)
  reservation.guest = User.all.reject {|user| user.id == reservation.lodging.administrator_id}.sample(1).first
  reservation.end_date = reservation.start_date + rand(1..30).day
  reservation.save
end
