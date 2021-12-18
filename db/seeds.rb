# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Owner.create!(
  ENV['email'],
  ENV['password']
  )

Customer.create!(
  family_name: "海江田",
  first_name: "龍",
  family_name_kana: "カイエダ",
  first_name_kana: "リュウ",
  post_address: "0000000",
  address: "彗星",
  phone_number: "1234567890",
  email: "k@k",
  password: "kairyu",
  is_deleted: false,
  )

  Genre.create(
  [{
      name: "ケーキ"
  }]
  )
