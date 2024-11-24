# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data (optional, be cautious with this)
OrderItem.delete_all
Order.delete_all
User.delete_all
MenuItem.delete_all

# Create User
user1 = User.create!(name: "Admin", role: 'admin',email: 'admin@cafe.com',password:12345678)
user2 = User.create!(name: "Mrs.Ashwini", role: 'guest',email: 'guest-user@cafe.com',password:12345678)

# Create Orders
order1 = Order.create!(status: "Received", total_amount: 50.0, payment_status: "Pending", user_id: user2.id, table_number: 1)
order2 = Order.create!(status: "Preparing", total_amount: 75.0, payment_status: "Paid", user_id: user2.id, table_number: 1)

# Create MenuItems with images from public/images folder
menu_item1 = MenuItem.create!(
  name: "Pizza",
  description: "Delicious pizza with cheese and toppings",
  price: 10.99
)
menu_item1.image.attach(io: File.open(Rails.root.join('public/images/pizza.jpg')), filename: 'pizza.jpg')

menu_item2 = MenuItem.create!(
  name: "Burger",
  description: "Juicy beef burger with lettuce and tomatoes",
  price: 8.49
)
menu_item2.image.attach(io: File.open(Rails.root.join('public/images/burger.jpg')), filename: 'burger.jpg')

menu_item3 = MenuItem.create!(
  name: "Salad",
  description: "Fresh garden salad with mixed greens and dressing",
  price: 5.99
)
menu_item3.image.attach(io: File.open(Rails.root.join('public/images/salad.jpg')), filename: 'salad.jpg')

menu_item4 = MenuItem.create!(
  name: "Pasta",
  description: "Creamy Alfredo pasta",
  price: 12.99
)
menu_item4.image.attach(io: File.open(Rails.root.join('public/images/pasta.jpg')), filename: 'pasta.jpg')

menu_item5 = MenuItem.create!(
  name: "Sushi",
  description: "Assorted sushi platter",
  price: 15.49
)
menu_item5.image.attach(io: File.open(Rails.root.join('public/images/sushi.jpg')), filename: 'sushi.jpg')

menu_item6 = MenuItem.create!(
  name: "Tacos",
  description: "Spicy beef tacos with salsa",
  price: 9.99
)
menu_item6.image.attach(io: File.open(Rails.root.join('public/images/tacos.jpg')), filename: 'tacos.jpg')

# Create OrderItems
order_item1 = OrderItem.create!(
  order_id: order1.id,
  menu_item_id: menu_item1.id,
  quantity: 2
)

order_item2 = OrderItem.create!(
  order_id: order1.id,
  menu_item_id: menu_item2.id,
  quantity: 1
)

order_item3 = OrderItem.create!(
  order_id: order2.id,
  menu_item_id: menu_item3.id,
  quantity: 3
)

puts "Seed data created successfully!"
