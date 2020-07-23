# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(email: "test@test.com", password: "112233")

# Order.create!([
#   {member_id: 1, postal_code: "1234567", receiver: "森蘭丸", address: "愛知県名古屋市", postage: 800, payment_method: 1, total: 3570, order_status: 0},
#   {member_id: 2, postal_code: "1231234", receiver: "織田信長", address: "愛知県名古屋市", postage: 800, payment_method: 1, total: 4320, order_status: 0}])



OrderItem.create!([
  {order_id: 2, item_id: 1, quantity: 1, tax_included_price: 550, production_status: 0},
  {order_id: 2, item_id: 2, quantity: 1, tax_included_price: 660, production_status: 0},
  {order_id: 2, item_id: 3, quantity: 2, tax_included_price: 880, production_status: 0},
  {order_id: 3, item_id: 1, quantity: 2, tax_included_price: 550, production_status: 0},
  {order_id: 3, item_id: 2, quantity: 1, tax_included_price: 660, production_status: 0},
  {order_id: 3, item_id: 3, quantity: 2, tax_included_price: 880, production_status: 0}
])

# CartItem.create([ 
#   {item_id: 1, member_id: 1, quantity: 1}, 
#   {item_id: 3, member_id: 1, quantity: 2}, 
#   {item_id: 5, member_id: 1, quantity: 1}, 
#   {item_id: 1, member_id: 1, quantity: 1}, 
#   {item_id: 2, member_id: 2, quantity: 5}, 
#   {item_id: 4, member_id: 2, quantity: 3},
#   {item_id: 6, member_id: 2, quantity: 1}, 
#   {item_id: 1, member_id: 2, quantity: 2} 
# ])