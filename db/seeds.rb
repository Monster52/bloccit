require 'random_data'
Rails.logger.level = :error

Post.find_or_create_by(
  title: "Special Post",
  body: "Special post body"
)

50.times do |i|
  Post.create!(
    title: "#{i} " + RandomData.random_sentence,
    body: "#{i} " + RandomData.random_paragraph
  )
end
posts = Post.all
puts "#{Post.count} posts created"


Comment.find_or_create_by(
  post: posts[0],
  body: "Awesome Post"
)

100.times do |i|
  Comment.create!(
    post: posts.sample,
    body: "#{i} " + RandomData.random_paragraph
  )
end
puts "#{Comment.count} comments created"

puts "Seed finished"
