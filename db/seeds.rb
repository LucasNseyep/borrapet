# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'date'
require 'open-uri'

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
    address:Faker::Address.city,
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



pet_name = "Big Al"
file = URI.open("https://static.wikia.nocookie.net/isle/images/c/c0/Spino_new_hd_4k.PNG/revision/latest?cb=20200208141308")
pet = Pet.create(
    user_id: rand(User.first.id..User.last.id),
    pet_type: "Dinosaur",
    breed: "~~~",
    name: pet_name,
    bio: "The biggest carnivorous dinosaur of them all! The Spinosaurus diet consisted mainly of fish. Was the main villain of 'Jurrasic-park' 3.",
  )
pet.photo.attach(io: file, filename: "big_al.jpeg", content_type: "image/jpg")
pet.save
puts "Awww, #{pet_name} joined the platform xx"



pet_name = "Hayley"
file = URI.open("https://cdn.britannica.com/09/74609-050-21E14E52/example-museum-replica-species-Canadian-de-extinction.jpg")
pet = Pet.create(
    user_id: rand(User.first.id..User.last.id),
    pet_type: "Mammoth",
    breed: "~~~",
    name: pet_name,
    bio: "She was the model for Ice Age.",
  )
pet.photo.attach(io: file, filename: "hayley.jpeg", content_type: "image/jpg")
pet.save
puts "Awww, #{pet_name} joined the platform xx"



pet_name = "Arthur"
file = URI.open("https://media.cnn.com/api/v1/images/stellar/prod/220920074153-01-ant-population-estimate.jpg?c=16x9&q=h_720,w_1280,c_fill")
pet = Pet.create(
    user_id: rand(User.first.id..User.last.id),
    pet_type: "Ant",
    breed: "~~~",
    name: pet_name,
    bio: "Just your everyday ant. I like being part of a group. All hail the queen!",
  )
pet.photo.attach(io: file, filename: "arthur.jpeg", content_type: "image/jpg")
pet.save
puts "Awww, #{pet_name} joined the platform xx"



pet_name = "Marcus"
file = URI.open("https://a-z-animals.com/media/2021/10/gray-wolf-cubs-in-a-grass-picture-id657385992.jpg")
pet = Pet.create(
    user_id: rand(User.first.id..User.last.id),
    pet_type: "Wolf",
    breed: "~~~",
    name: pet_name,
    bio: "Awoooooooooo",
  )
pet.photo.attach(io: file, filename: "big_al.jpeg", content_type: "image/jpg")
pet.save
puts "Awww, #{pet_name} joined the platform xx"



pet_name = "ClairClair"
file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Garden_skink.jpg/1024px-Garden_skink.jpg")
pet = Pet.create(
    user_id: rand(User.first.id..User.last.id),
    pet_type: "Skink",
    breed: "~~~",
    name: pet_name,
    bio: "Skink Skink Skurrr Skurrr",
  )
pet.photo.attach(io: file, filename: "big_al.jpeg", content_type: "image/jpg")
pet.save
puts "Awww, #{pet_name} joined the platform xx"



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
