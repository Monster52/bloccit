require 'random_data'

# Create Users

5.times do |i|
  User.create!(
    name: "#{i}_" + RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end

# Create Admin User
unless User.find_by(email: 'admin@example.com')
  User.create!(
    name: 'admin example',
    email: 'admin@example.com',
    password: 'helloworld',
    role: 'admin'
  )
  puts "created static Admin User."
  puts "Email: #{admin.email} Password: #{admin.password}"
else
  puts "Skipped creation of \"admin@example.com\""
end

unless User.find_by(email: "cindy@gmail.com")
  member = User.create!(
    name: "Cindy Waguespack",
    email: "cindy@gmail.com",
    password: "password"
  )
  puts "created static Member User."
  puts "Email: #{member.email} Password: #{member.password}"
else
  puts "Skipped creation of \"cindy@gmail.com\""
end


users = User.all
puts "#{User.count} users created."

# Create Topics
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

# Create Posts
50.times do |i|
  post = Post.create!(
    title: "#{i}_" + RandomData.random_sentence,
    body: "#{i}_" + RandomData.random_paragraph,
    user: users.sample,
    topic: topics.sample
  )

  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end
posts = Post.all
puts "#{Post.count} posts created"
puts "#{Vote.count} votes created"

# Create Comments
100.times do |i|
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: "#{i}_" + RandomData.random_paragraph
  )
end
puts "#{Comment.count} comments created"

puts "Seed finished"

