# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  u = User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )


  Wiki.create(
  title: Faker::Lorem.word,
  body: Faker::Lorem.paragraph(2, false, 4)
  user_id: u.id
  )
end

30.times do
  Wiki.create(
  title: Faker::Lorem.word,
  body: Faker::Lorem.paragraph(2, false, 4)
  user_id: User.all.sample.id
  )
end
