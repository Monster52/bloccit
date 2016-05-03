require 'random_data'

# Create Users

5.times do |i|
  User.create!(
    name: "#{i}_" + RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end

unless User.find_by(email: 'rosswaguespack@gmail.com')
  User.create!(
    name: RandomData.random_name,
    email: 'rosswaguespack@gmail.com',
    password: 'password'
  )
end

unless User.find_by(email: 'admin@example.com')
  User.create!(
    name: 'admin example',
    email: 'admin@example.com',
    password: 'password'
  )
end

users = User.all
puts "#{User.count} users created"


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
    title: "#{i}_" + RandomData.random_sentence,
    body: "#{i}_" + RandomData.random_paragraph,
    user: users.sample,
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
puts "#{Comment.count} comments created"


puts "Seed finished"
