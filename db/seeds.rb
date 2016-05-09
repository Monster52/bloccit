require 'random_data'

# Create Users

5.times do |i|
  User.create!(
    name: "#{i}_" + RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

15.times do |i|
  Topic.create!(
    name: "#{i}_" + RandomData.random_sentence,
    description: "#{i}_" + RandomData.random_paragraph,
    public: rand(1..4) != 1
  )
end
topics = Topic.all
puts "#{Topic.count} topics created"
puts "#{Topic.where(public: false).count} private topics created"

50.times do |i|
  Post.create!(
    user: users.sample,
    title: "#{i}_" + RandomData.random_sentence,
    body: "#{i}_" + RandomData.random_paragraph,
    topic: topics.sample
  )
end
posts = Post.all
puts "#{Post.count} posts created"

100.times do |i|
  Comment.create!(
    post: posts.sample,
    body: "#{i}_" + RandomData.random_paragraph
  )
end

admin = User.create!(
  name: "Ross Waguespack",
  email: "ross@bloc.com",
  password: "password",
  role: "admin"
)

member = User.create!(
  name: "Cindy Waguespack",
  email: "cindy@gmail.com",
  password: "password"
)


puts "Seed finished"


