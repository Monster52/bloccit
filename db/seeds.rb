require 'random_data'
Rails.logger.level = :error

15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end

topics = Topic.all

20.times do
  SponsoredPost.create!(
    topic_id: topics.sample.id,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

sponsored_post = SponsoredPost.all

50.times do
  Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
comments = Comment.all

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{SponsoredPost.count} sponsored post created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
