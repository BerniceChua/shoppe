# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username:'admin', password:'admin123',email:'admin@site.com',permissions:'admin')

5.times do |count|
  Product.create(title: "Item #{count}", price: rand(1..10), description: "Our #{count} item!", picture: "/link/to/the_picture_#{count}.png")
end
