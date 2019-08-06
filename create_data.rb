require_relative 'database_config'

users = []
10.times do |i|
  users << User.create(email: "tester#{i}@test.com", password: 'pudding')
end

pics = []
3.times do
  pics << Picture.create(owner: users.first)
end

comments = []
5.times do
  comments << Comment.create(user: users.first, picture: pics.first)
end

10.times do |i|
  Like.create(user: users[i], up_vote: comments.first)
end

5.times do |i|
  Like.create(user: users[i], up_vote: comments.last)
end
