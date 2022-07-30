# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  email: "admin@gmail.com",
  password: '123456789',
  first_name: "Admin",
  last_name: ""
)

User.create!(
  email: 'user@domain.com',
  password: '123456789',
  first_name: "user",
  last_name: "Second"
)

User.create!(
  :email => 'john@gmail.com',
  :password => '123456789',
  first_name: "John",
  last_name: "Third"
)

User.create!(
  :email => 'tom_user@gmail.com',
  :password => '123456789',
  first_name: "Tom",
  last_name: "User"
)
