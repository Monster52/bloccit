require 'random_data'

# Create Users

5.times do |i|
  User.create!(
    name: "#{i}_" + RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end

unless User.find_by(email: "ross@bloc.com")
  admin = User.create!(
    name: "Ross Waguespack",
    email: "ross@bloc.com",
    password: "password",
    role: "admin"
  )
  puts "created static Admin User."
  puts "Email: #{admin.email} Password: #{admin.password}"
else
  puts "Skipped creation of \"ross@bloc.com\""
end

unless User.find_by(email: "admin@example.com")
  admin = User.create!(
    name: "Ross Waguespack",
    email: "admin@example.com",
    password: "helloworld",
    role: "admin"
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

# Create Comments
100.times do |i|
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: "#{i}_" + RandomData.random_paragraph
  )
end




puts "Seed finished"


