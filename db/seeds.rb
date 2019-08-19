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

Artist.create!(name: "hosizakana")
Artist.create!(name: "米津玄氏")
Artist.create!(name: "daoko")
Artist.create!(name: "あいみょん")
Artist.create!(name: "安室奈美恵")
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

600.times do |n|
  Product.create!(name: "CD商品名#{n+1}",
                  artist_id: "#{rand(1..5)}",
                  label_id: "#{rand(1..5)}",
                  genre_id: "#{rand(1..8)}",
                 status: "販売中",
                 image: open("#{Rails.root}/db/fixtures/img#{rand(1..9)}.jpeg"),
                 price: "#{rand(10000)}",
                 stock: "#{rand(500)}",
                 is_deleted: false
                 )
end

products = Product.order(:created_at).take(60)
5.times do |n|
  song = "曲名#{n+1}"
  products.each {|product| product.songs.create!(name: song, disk: 1)}
end

600.times do |n|
  Favorite.create!(user_id: "#{n+1}",
                   product_id: "#{rand(1..200)}")
end
