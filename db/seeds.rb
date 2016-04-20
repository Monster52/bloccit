require 'random_data'

50.times do |i|
  Post.create!(
    title: "#{i} " + RandomData.random_sentence,
    body: "#{i} " + RandomData.random_paragraph
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

10.times do
  Question.create!(
   title: RandomData.random_sentence,
   body: RandomData.random_paragraph,
   resolved: true
  )
end
puts "#{Question.count} questions created"

puts "Seed finished"

