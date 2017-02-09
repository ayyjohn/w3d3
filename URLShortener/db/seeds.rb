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

short1 = ShortenedUrl.shorten(user1, "http://google.com")
short2 = ShortenedUrl.shorten(user2, "https://yahoo.com")

Visit.destroy_all

Visit.record_visit!(user1, short2)
Visit.record_visit!(user2, short1)
Visit.record_visit!(user2, short1)

TagTopic.destroy_all

TagTopic.create!(tag: "Sports")
TagTopic.create!(tag: "Music")
TagTopic.create!(tag: "Games")
