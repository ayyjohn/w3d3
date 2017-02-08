# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

user1 = User.create!(email: "genericemail@gmail.com")
user2 = User.create(email: "sendcrudhere@yahoo.com")

ShortenedUrl.destroy_all

ShortenedUrl.create!(
  short_url: "bit.ly/someth",
  long_url: "https://somethinglong.com",
  user_id: user1.id
)

ShortenedUrl.create!(
  short_url: "bit.ly/somet2",
  long_url: "https://somethingelse.com",
  user_id: user2.id
)
