require 'random_data'
Rails.logger.level = :error

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

20.times do 
  Advertisement.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: RandomData.random_price
  )
end
puts "#{Advertisement.count} advertisements created"

puts "Seed finished"

