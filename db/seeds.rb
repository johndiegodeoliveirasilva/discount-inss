# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating User Default"

user = User.create(
  email: "default@gmail.com",
  password: "123456",
)

user.proposers.create!(
  full_name: Faker::Name.name,
  document: Faker::IDNumber.brazilian_citizen_number(formatted: true),
  birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
  income: 3000.50
)
