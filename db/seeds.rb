require 'random_data'

Post.find_or_create_by(
  title: "Special Post",
  body: "Special post body"
)

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

Comment.find_or_create_by(
  post: posts[0],
  body: "Awesome Post"
)

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
