# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username:'admin', password:'admin123',email:'admin@site.com',permissions:'admin')

# 5.times do |count|
#   Category.create(name: Faker::Commerce.department)
# end

# 5.times do |count|
#   fake_product = Product.create(title: "Item #{count}", price: rand(1..10), description: "Our #{count} item!", picture: "/link/to/the_picture_#{count}.png")
#   Category.find(rand(1..5)).products << fake_product
# end

Category.create(name: "Ferghana Horses")
Category.create(name: "Guoxia Horses")
Category.create(name: "Clydesdales")
Category.create(name: "Thoroughbreds")
Category.create(name: "Miniatures")
Category.create(name: "Shetland Ponies")
Category.create(name: "Arabian Horses")
Category.create(name: "Curly Horses")
Category.create(name: "Lipizzan Horses")
Category.create(name: "Marwari Horses")

Category.all.each do |count|
  5.times do
    fake_product = Product.create(title: Faker::Name.first_name, price: rand(1..10), description: "Our #{count.name}!", picture: "/link/to/the_picture_#{count}.png")
    Category.find(count.id).products << fake_product
  end
end

@users = User.all
@users.each do |user|
	Cart.create(user_id: user.id)
end
# 5.times do
# Cart.all.each do |cart|
# 	cart.products << Product.all[rand(0..62)]
# 	end
# end



