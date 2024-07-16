# Clear existing data (optional, be cautious with this)
OrderItem.delete_all
Order.delete_all
User.delete_all
MenuItem.delete_all

# Create User
user2 = User.create!(name: "Admin", role: 'admin')

user2 = User.create!(name: "User 1", role: 'guest')

# Create Orders
order1 = Order.create!(status: "Received", total_amount: 50.0, payment_status: "Pending", user_id: user2.id, table_number: 1)
order2 = Order.create!(status: "Preparing", total_amount: 75.0, payment_status: "Paid", user_id: user2.id, table_number: 1)

# Create MenuItems with attached images
menu_item1 = MenuItem.create!(
  name: "Pizza",
  description: "Delicious pizza with cheese and toppings",
  price: 10.99
)
menu_item1.image.attach(io: File.open(Rails.root.join('public', 'images', 'pizza.jpg')), filename: 'pizza.jpg')

menu_item2 = MenuItem.create!(
  name: "Burger",
  description: "Burger with lettuce and tomatoes",
  price: 8.49
)
menu_item2.image.attach(io: File.open(Rails.root.join('public', 'images', 'burger.jpg')), filename: 'burger.jpg')

menu_item3 = MenuItem.create!(
  name: "Salad",
  description: "Fresh garden salad with mixed greens and dressing",
  price: 5.99
)
menu_item3.image.attach(io: File.open(Rails.root.join('public', 'images', 'salad.jpg')), filename: 'salad.jpg')

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

puts "Data seeded successfully"