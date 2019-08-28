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





# 5.times do |n|
#   Label.create!(name: "レーベル#{n+1}")
# end

100.times do |n|
  Product.create!(name: "ベストアルバム#{n+1}",
                  artist_id: 1,
                  label_id: "#{1}",
                  genre_id: "#{6}",
                 status: "販売中",
                 image: open("#{Rails.root}/db/fixtures/Ariana Grande/#{rand(1.jpg..6.jpg)}"),
                 price: "#{rand(10000)}",
                 stock: "#{rand(100)}",
                 is_deleted: false)
  Product.create!(name: "ベストアルバム#{n+1}",
                  artist_id: 2,
                  label_id: "#{2}",
                  genre_id: "#{5}",
                 status: "販売中",
                 image: open("#{Rails.root}/db/fixtures/avicii/#{rand(1.jpg..5.jpg)}"),
                 price: "#{rand(10000)}",
                 stock: "#{rand(100)}",
                 is_deleted: false)
  Product.create!(name: "ベストアルバム#{n+1}",
                  artist_id: 3,
                  label_id: "#{3}",
                  genre_id: "#{4}",
                 status: "販売中",
                 image: open("#{Rails.root}/db/fixtures/Bruno Mars/#{rand(1.jpg..4.jpg)"),
                 price: "#{rand(10000)}",
                 stock: "#{rand(100)}",
                 is_deleted: false)
  Product.create!(name: "ベストアルバム#{n+1}",
                 artist_id: 4,
                 label_id: "#{4}",
                 genre_id: "#{3}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/Cher Lloyd/#{rand(1.jpg..5.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 5,
                label_id: "#{1}",
                genre_id: "#{4}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/Diplo/#{rand(1.jpg..9.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 6,
                label_id: "#{2}",
                genre_id: "#{3}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/DJ snake/#{rand(1.jpg..9.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 7,
                label_id: "#{3}",
                genre_id: "#{2}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/Kygo/#{rand(1.jpg..6.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 8,
                label_id: "#{4}",
                genre_id: "#{1}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/lil nas X/#{rand(1.jpg..4.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 9,
                label_id: "#{5}",
                genre_id: "#{6}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/lil peep/#{rand(1.jpg..5.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 10,
                label_id: "#{2}",
                genre_id: "#{4}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/lil uzi vert/#{rand(1.jpg..7.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 11,
                label_id: "#{3}",
                genre_id: "#{3}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/Martin Garrix/#{rand(1.jpg..8.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 12,
                label_id: "#{4}",
                genre_id: "#{8}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/Miley Cyrus/#{rand(1.jpg..6.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 13,
                label_id: "#{5}",
                genre_id: "#{2}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/post malone/#{rand(1.jpg..5.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 14,
                label_id: "#{1}",
                genre_id: "#{1}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/Selena Gomez/#{rand(1.jpg..5.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 15,
                label_id: "#{2}",
                genre_id: "#{6}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/Selena Gomez/#{rand(1.jpg..5.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 16,
                label_id: "#{3}",
                genre_id: "#{5}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/Ty Dolla $ign/#{rand(1.jpg..8.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 17,
                label_id: "#{4}",
                genre_id: "#{4}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/XXXTENTACION/#{rand(1.jpg..5.jpg)}"),
                price: "#{rand(10000)}",
                stock: "#{rand(100)}",
                is_deleted: false)
Product.create!(name: "ベストアルバム#{n+1}",
                artist_id: 18,
                label_id: "#{5}",
                genre_id: "#{2}",
                status: "販売中",
                image: open("#{Rails.root}/db/fixtures/Yellow Claw/#{rand(1.jpg..7.jpg)}"),
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
