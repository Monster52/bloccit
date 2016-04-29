require 'random_data'
Rails.logger.level = :error

<<<<<<< HEAD
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

50.times do
  Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
=======
50.times do |i|
  Post.create!(
    title: "#{i} " + RandomData.random_sentence,
    body: "#{i} " + RandomData.random_paragraph
>>>>>>> 4b7e49933208dbe9fba68b88a489d2894458eb52
  )
end
posts = Post.all
puts "#{Post.count} posts created"


100.times do |i|
  Comment.create!(
    post: posts.sample,
    body: "#{i} " + RandomData.random_paragraph
  )
end
puts "#{Comment.count} comments created"

puts "Seed finished"
<<<<<<< HEAD
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
=======
>>>>>>> 4b7e49933208dbe9fba68b88a489d2894458eb52
