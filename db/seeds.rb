# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8
#
#


50.times do |n|
  email = "example-#{n+1}@hosizakana.com"
  password = "000000"
  address = "東京都渋谷神南101#{n+1}"
  phone = "0000000#{n+1}"
  User.create!(last_name: "干し魚",
             first_name: "太郎",
             first_name_kana: "ホシザカナ",
             last_name_kana: "タロウ",
             postal_code: "123-4567",
             adress:  address,
             phone: phone,
             email: email,
             password: password,
             is_deleted: false
             )
end
 Artist.create!(name: "Ariana Grande")
 Artist.create!(name: "Avicii")
 Artist.create!(name: "Bruno Mars")
 Artist.create!(name: "Cher Lloyd")
 Artist.create!(name: "Diplo")
 Artist.create!(name: "DJ snake")
 Artist.create!(name: "Kygo")
 Artist.create!(name: "lil nas X")
 Artist.create!(name: "lil peep")
 Artist.create!(name: "lil uzi vert")
 Artist.create!(name: "Martin Garrix")
 Artist.create!(name: "Miley Cyrus")
 Artist.create!(name: "post malone")
 Artist.create!(name: "Selena Gomez")
 Artist.create!(name: "Ty Dolla $ign")
 Artist.create!(name: "XXXTENTACION")
 Artist.create!(name: "Yellow Claw")

Genre.create!(name: "J-pop")
Genre.create!(name: "K-pop")
Genre.create!(name: "ロック")
Genre.create!(name: "ダンス")
Genre.create!(name: "ジャズ")
Genre.create!(name: "クラシック")
Genre.create!(name: "サウンドトラック")
Genre.create!(name: "その他")

Label.create!(name: "VEVO")
Label.create!(name: "Billboard")
Label.create!(name: "UMG")
Label.create!(name: "WMG")
Label.create!(name: "EMI")

# 商品
200.times do |n|
release_date =  Faker::Time.between_dates(from: Date.today - 100, to: Date.today + 10, period: :all)
  array = ["販売中","販売停止中"]
  array_i = ["1000","2000","3000"]
  Product.create!(name: Faker::Music.album,
                  artist_id: 1,
                  label_id: "#{1}",
                  genre_id: "#{6}",
                  release_date: release_date,
                 status: array[rand(2)],
                 image: open("#{Rails.root}/db/fixtures/Ariana Grande/#{rand(1..6)}.jpg"),
                 price: array_i[rand(3)],
                 stock: "#{rand(50)}",
                 is_deleted: false)
  Product.create!(name: Faker::Music.album,
                  artist_id: 2,
                  label_id: "#{2}",
                  release_date: release_date,
                  genre_id: "#{5}",
                 image: open("#{Rails.root}/db/fixtures/avicii/#{rand(1..5)}.jpg"),
                 status: array[rand(2)],
                 price: array_i[rand(3)],
                 stock: "#{rand(50)}",
                 is_deleted: false)
  Product.create!(name: Faker::Music.album,
                  artist_id: 3,
                  label_id: "#{3}",
                  release_date: release_date,
                  genre_id: "#{4}",
                 status: array[rand(2)],
                 image: open("#{Rails.root}/db/fixtures/Bruno Mars/#{rand(1..4)}.jpg"),
                 price: array_i[rand(3)],
                 stock: "#{rand(50)}",
                 is_deleted: false)
  Product.create!(name: Faker::Music.album,
                 artist_id: 4,
                 label_id: "#{4}",
                 genre_id: "#{3}",
                  release_date: release_date,
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/Cher Lloyd/#{rand(1..5)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 5,
                label_id: "#{1}",
                genre_id: "#{4}",
                status: "販売中",
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/Diplo/#{rand(1..9)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 6,
                label_id: "#{2}",
                genre_id: "#{3}",
                status: "販売中",
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/DJ snake/#{rand(1..7)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 7,
                label_id: "#{3}",
                genre_id: "#{2}",
                status: "販売中",
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/Kygo/#{rand(1..6)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 8,
                label_id: "#{4}",
                genre_id: "#{1}",
                 status: array[rand(2)],
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/lil nas X/#{rand(1..4)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 9,
                label_id: "#{5}",
                genre_id: "#{6}",
                status: "販売中",
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/lil peep/#{rand(1..5)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 10,
                label_id: "#{2}",
                genre_id: "#{4}",
                status: "販売中",
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/lil uzi vert/#{rand(1..7)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 11,
                label_id: "#{3}",
                genre_id: "#{7}",
                status: "販売中",
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/Martin Garrix/#{rand(1..8)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 12,
                label_id: "#{4}",
                genre_id: "#{8}",
                status: "販売中",
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/Miley Cyrus/#{rand(1..6)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 13,
                label_id: "#{5}",
                genre_id: "#{2}",
                 status: array[rand(2)],
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/post malone/#{rand(1..5)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 14,
                label_id: "#{2}",
                genre_id: "#{6}",
                status: "販売中",
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/Selena Gomez/#{rand(1..5)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 15,
                label_id: "#{3}",
                genre_id: "#{5}",
                 status: array[rand(2)],
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/Ty Dolla $ign/#{rand(1..8)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 16,
                label_id: "#{4}",
                genre_id: "#{4}",
                status: "販売中",
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/XXXTENTACION/#{rand(1..5)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
  Product.create!(name: Faker::Music.album,
                artist_id: 17,
                label_id: "#{5}",
                genre_id: "#{2}",
                status: "販売中",
                  release_date: release_date,
                image: open("#{Rails.root}/db/fixtures/Yellow Claw/#{rand(1..7)}.jpg"),
                 price: array_i[rand(3)],
                stock: "#{rand(100)}",
                is_deleted: false)
end

# 曲
products = Product.order(:created_at).take(3400)
8.times do |n|
  song = Faker::Music::GratefulDead.song
  products.each {|product| product.songs.create!(name: song, disk: 1)}
end



# 10.times do |n|
#   user = User.find_by(id: "#{n+1}")
#   phone = "080#{rand(11111111..99999999)}"
#   Addresses.create!(user_id: user.id,
#              last_name: user.last_name,
#              first_name: user.first_name,
#              last_name_kana: user.last_name_kana,
#              first_name_kana: user.first_name_kana,
#              postal_code: "#{rand(1111111..9999999)}",
#              adress: user.address,
#              phone: phone,
#              )
# end


50.times do |n|
  user = User.find_by(id: "#{n+1}")
  CartItem.create!(product_id: "#{rand(1..100)}",
                     user_id: user.id,
                   item_number: "#{rand(1..3)}",
             )
end

50.times do |n|
  cart_item = CartItem.find_by(id: "#{n+1}")
  product = Product.find_by(id: cart_item.product_id)
  number = cart_item.item_number
  pprice = product.price
  price = "#{number * pprice * 1.08 + 500}"
  user = User.find_by(id: "#{n+1}")
  array = ["発送済み","発送準備中","キャンセル"]
  Order.create!(user_id: user.id,
             shipping_status: array[rand(3)],
             last_name: user.last_name,
             first_name: user.first_name,
             last_name_kana: user.last_name_kana,
             first_name_kana: user.first_name_kana,
             postal_code: user.postal_code,
             address:  user.adress,
             phone: user.phone,
             total_price: price,
             )
end
50.times do |n|
  cart_item = CartItem.find_by(id: "#{n+1}")
  product = Product.find_by(id: "#{n+1}")
  order = Order.find_by(id: "#{n+1}")
  OrderItem.create!(product_id: cart_item.product_id,
                    item_number: cart_item.item_number,
                   order_id: order.id,
                   price: product.price
             )
end

CartItem.delete_all

# いいね
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(1..10)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(10..20)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(21..30)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(31..40)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(40..50)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(51..60)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(61..70)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(71..80)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(81..90)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(91..100)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(3351..3360)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(3361..3370)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(3371..3380)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(3381..3390)}")
end
50.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(3391..3400)}")
end
