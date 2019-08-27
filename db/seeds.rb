# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

600.times do |n|
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

 Artist.create!(name: "あいみょん")
 Artist.create!(name: "lilbunb")
 Artist.create!(name: "安室奈美恵")
 Artist.create!(name: "daoko")
 Artist.create!(name: "ラストアイドル")

Genre.create!(name: "J-pop")
Genre.create!(name: "K-pop")
Genre.create!(name: "ロック")
Genre.create!(name: "ダンス")
Genre.create!(name: "ジャズ")
Genre.create!(name: "クラシック")
Genre.create!(name: "サウンドトラック")
Genre.create!(name: "その他")

5.times do |n|
  Label.create!(name: "レーベル#{n+1}")
end

100.times do |n|
  Product.create!(name: "ベストアルバム#{n+1}",
                  artist_id: 1,
                  label_id: "#{1}",
                  genre_id: "#{1}",
                 status: "販売中",
                 image: open("#{Rails.root}/db/fixtures/img1.jpeg"),
                 price: "#{rand(10000)}",
                 stock: "#{rand(100)}",
                 is_deleted: false)
  Product.create!(name: "ベストアルバム#{n+1}",
                  artist_id: 2,
                  label_id: "#{2}",
                  genre_id: "#{8}",
                 status: "販売中",
                 image: open("#{Rails.root}/db/fixtures/img2.jpeg"),
                 price: "#{rand(10000)}",
                 stock: "#{rand(100)}",
                 is_deleted: false)
  Product.create!(name: "ベストアルバム#{n+1}",
                  artist_id: 3,
                  label_id: "#{3}",
                  genre_id: "#{6}",
                 status: "販売中",
                 image: open("#{Rails.root}/db/fixtures/img3.jpeg"),
                 price: "#{rand(10000)}",
                 stock: "#{rand(100)}",
                 is_deleted: false)
end

products = Product.order(:created_at).take(600)
5.times do |n|
  song = "曲名#{n+1}"
  products.each {|product| product.songs.create!(name: song, disk: 1)}
end

100.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(1..10)}")
end
100.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(10..20)}")
end
100.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(21..30)}")
end
100.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(31..40)}")
end
100.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(40..50)}")
end
100.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(51..60)}")
end
100.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(61..70)}")
end
100.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(71..80)}")
end
100.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(81..90)}")
end
100.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(91..100)}")
end
