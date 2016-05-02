require 'random_data'
Rails.logger.level = :error

# Create Users

5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

50.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

100.times do |i|
  Comment.create!(
    post: posts.sample,
    body: "#{i} " + RandomData.random_paragraph
  )
end
puts "#{Comment.count} comments created"

user = User.first
user.update_attributes!(
  email: 'rosswaguespack@gmail.com',
  password: 'password'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
