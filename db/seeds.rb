# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Clear existing data (optional, be cautious with this)
# OrderItem.delete_all
# Order.delete_all
# User.delete_all
# MenuItem.delete_all


# User.create!(name:"Sanket",role:'admin')
user2 = User.create!(name:"Bantul",role:'guest')
# Create User

# Create Orders
order1 = Order.create!(status: "Received",total_amount: 50.0, payment_status: "Pending",user_id:user2.id,table_number:1)
order2 = Order.create!(status: "Preparing", total_amount: 75.0, payment_status: "Paid",user_id:user2.id,table_number:1)



# Create MenuItems
menu_item1 = MenuItem.create!(
  name: "Pizza",
  description: "Delicious pizza with cheese and toppings",
  price: 10.99
)

menu_item2 = MenuItem.create!(
  name: "Burger",
  description: "Juicy beef burger with lettuce and tomatoes",
  price: 8.49
)

menu_item3 = MenuItem.create!(
  name: "Salad",
  description: "Fresh garden salad with mixed greens and dressing",
  price: 5.99
)

# Create OrderItems
order_item1 = OrderItem.create!(
  order_id: order1.id,  # Replace with actual order_id if needed
  menu_item_id: menu_item1.id,
  quantity: 2
)

order_item2 = OrderItem.create!(
  order_id:  order1.id,  # Replace with actual order_id if needed
  menu_item_id: menu_item2.id,
  quantity: 1
)

order_item3 = OrderItem.create!(
  order_id:  order2.id,  # Replace with actual order_id if needed
  menu_item_id: menu_item3.id,
  quantity: 3
)


puts "Seed data created successfully!"
