# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..3).each do |i|
  User.create(username: i, email: "#{i}@#{i}.com", password: "123456", password_confirmation: "123456")
  # (1..3).each do |j|
    # Post.create(title: "#{i}가 #{j}번째 글을 작성", content: "#{i}가 쓴 #{j}번 째 글", user_id: i)
  # end
end