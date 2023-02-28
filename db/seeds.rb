# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
Pet.destroy_all
User.destroy_all

puts "Creating Marco"

user = User.create(
  email: "marco@borrapet.com",
  password: "1234567",
  phone_number: Faker::PhoneNumber.cell_phone,
  first_name: "Marco",
  last_name: "Marco",
  address:Faker::Address.full_address
)

puts "Other Users"

35.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create(
    email: "#{first_name.downcase}.#{last_name.downcase}@borrapet.com",
    password: "1234567",
    phone_number: Faker::PhoneNumber.cell_phone,
    first_name: first_name,
    last_name: last_name,
    address:Faker::Address.full_address
  )

  puts "#{first_name} #{last_name} joined the platform!"
end

puts "All the users have been added!"

puts "\n\n\nCreating pets\n
  __      _
o'')}____//
 `_/      )
 (_(_/-(_/

 \n\n\n"


7.times do
  pet_name = Faker::Creature::Dog.name
  pet = Pet.new(
      user_id: rand(User.first.id..User.last.id),
      pet_type: Faker::Creature::Animal.name,
      breed: "Ask Carol",
      name: pet_name,
      bio: Faker::Lorem.paragraphs
    )
    pet.save
  puts "Awww, #{pet_name} joined the platform xx"
end

puts "Pets are in"

# puts "Organising some playdates with our furry friends"

# 21.times do
#   user = rand(User.first.id..User.last.id)
#   pet = rand(Pet.first.id..Pet.last.id)
# end
