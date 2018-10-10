# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "上長A",
             email: "jyouchou@railstutorial.org",
             password:              "foobar1",
             password_confirmation: "foobar1",
             superior:     true,
             activated: true,
             activated_at: Time.zone.now)             
             
User.create!(name:  "上長B",
             email: "jyouchou-1@railstutorial.org",
             password:              "foobar2",
             password_confirmation: "foobar2",
             superior:     true,
             activated: true,
             activated_at: Time.zone.now)             

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

user = User.find_by(id:4)
user.monthly_authentications.create!(year: 2018,
                                 month: 10,
                                 certifier: 2,
                                 status: "申請中"
                                 )
user.monthly_authentications.create!(year: 2018,
                                 month: 11,
                                 certifier: 2,
                                 status: "申請中"
                                 )                                
user_2 = User.find_by(id:3)
user_2.monthly_authentications.create!(year: 2018,
                                 month: 10,
                                 certifier: 2,
                                 status: "申請中"
                                 )

# users = User.order(:created_at).take(6)
# 50.times do
#   content = Faker::Lorem.sentence(5)
#   users.each { |user| user.microposts.create!(content: content) }
# end

# リレーションシップ
# users = User.all
# user  = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }