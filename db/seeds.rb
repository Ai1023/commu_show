# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "test@test.com",
  password: "test1111"
)

Tag.create([
    { tag_name: 'アクション' },
    { tag_name: 'パズル'},
    { tag_name: 'シミュレーション'},
    { tag_name: 'アドベンチャー' },
    { tag_name: 'FPS' },
    { tag_name: 'RPG'},
    { tag_name: 'その他'}
    ])