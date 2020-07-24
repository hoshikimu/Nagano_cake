# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(email: "test@test.com", password: "112233")

# Member.create!([
#   {id: 1, email: "aa@a", name_family: "織田", name_first: "信長", name_family_kana: "オダ", name_first_kana: "ノブナガ", postal_code: "0000000", address: "Owari", phone_number: "090000000", is_withdrawal_flag: "t", password: "112233"},
#   {id: 2, email: "bb@b", name_family: "豊臣", name_first: "秀吉", name_family_kana: "トヨトミ", name_first_kana: "ヒデヨシ", postal_code: "1111111", address: "Osaka", phone_number: "0600000", is_withdrawal_flag: "t", password: "112233"}
# ])

# Genre.create!([
#   {id: 1, name: "ケーキ", is_invalid_flag: true},{id: 2, name: "クッキー・焼き菓子", is_invalid_flag: true},{id: 3, name: "チョコレート", is_invalid_flag: false},{id: 4, name: "プリン・ゼリー", is_invalid_flag: true},
#   {id: 5, name: "和菓子", is_invalid_flag: true},{id: 6, name: "アイス", is_invalid_flag: false}
# ])

# Order.create!([
#   {member_id: 1, postal_code: "1234567", receiver: "森蘭丸", address: "愛知県名古屋市", postage: 800, payment_method: 1, total: 3770, order_status: 0},
#   {member_id: 2, postal_code: "1231234", receiver: "織田信長", address: "愛知県名古屋市", postage: 800, payment_method: 1, total: 4320, order_status: 0},
#   {member_id: 2, postal_code: "1112222", receiver: "茶々", address: "大阪府", postage: 800, payment_method: 0, total: 3220, order_status: 0}])



# OrderItem.create!([
#   {order_id: 1, item_id: 1, quantity: 1, tax_included_price: 550, production_status: 0},
#   {order_id: 1, item_id: 2, quantity: 1, tax_included_price: 660, production_status: 0},
#   {order_id: 1, item_id: 3, quantity: 2, tax_included_price: 880, production_status: 0},
#   {order_id: 2, item_id: 1, quantity: 2, tax_included_price: 550, production_status: 0},
#   {order_id: 2, item_id: 2, quantity: 1, tax_included_price: 660, production_status: 0},
#   {order_id: 2, item_id: 3, quantity: 2, tax_included_price: 880, production_status: 0},
#   {order_id: 3, item_id: 2, quantity: 2, tax_included_price: 660, production_status: 0},
#   {order_id: 3, item_id: 1, quantity: 2, tax_included_price: 880, production_status: 0}
# ])

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