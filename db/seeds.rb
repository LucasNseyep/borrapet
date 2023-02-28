# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'date'

puts "Cleaning database..."
Pet.destroy_all
User.destroy_all
PlayDate.destroy_all

puts "Marco is signing up"

user = User.create(
  email: "marco@borrapet.com",
  password: "1234567",
  phone_number: Faker::PhoneNumber.cell_phone,
  first_name: "Marco",
  last_name: "Marco",
  address:Faker::Address.full_address
)

puts "Other users are signing up as well :O"

35.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create(
    email: "#{first_name.downcase}.#{last_name.downcase}@borrapet.com",
    password: "1234567",
    phone_number: Faker::PhoneNumber.cell_phone,
    first_name: first_name,
    last_name: last_name,
    address:Faker::Address.full_address,
    description: Faker::Lorem.paragraphs
  )

  puts "#{first_name} #{last_name} joined the platform!"
end

puts "All the users have signed up!"

puts "\n\n\nLooks like a sad dating app in here, let's add some pets ♥♥♥\n
  __      _
o'')}____//
 `_/      )
 (_(_/-(_/

 \n\n\n"


10.times do
  pet_name = Faker::Creature::Dog.name
  pet = Pet.new(
      user_id: rand(User.first.id..User.last.id),
      pet_type: Faker::Creature::Animal.name,
      breed: "~~~",
      name: pet_name,
      bio: description,
    )
    pet.save
  puts "Awww, #{pet_name} joined the platform xx"
end

puts "Who let the pets in XD"

puts "Organising some playdates with furry friends"

5.times do
  user = rand(User.first.id..User.last.id)
  pet = rand(Pet.first.id..Pet.last.id)
  date_start = Time.now.beginning_of_day + 10.hours + rand(0..30).days
  date_end = date_start + 7.hours + rand(0..14).days

  play_date = PlayDate.new(
    user_id: user,
    pet_id: pet,
    start_time: date_start,
    end_time: date_end,
  )
  play_date.save

  puts "#{play_date.user.first_name} has a date with #{play_date.pet.name} xoxo"
end

puts "Dates have been organised"

puts "All done :)"
