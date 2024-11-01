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
  full_name: "Default",
  birth_date: "01/01/1990",
  password: "123456",
  password_confirmation: "123456",
  document: '69423555420'
)

Address.create!(
  user: user,
  complement: '123 Rua Principal',
  number: '1',
  city: 'Santiago',
  state: 'RM',
  zip_code: '12345',
  neighborhood: '1'
)
