require 'random_data'

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

20.times do
  SponsoredPost.create!(
    topic_id: topics.sample.id,
    title: "#{i}_" + RandomData.random_sentence,
    body: "#{i}_" + RandomData.random_paragraph
  )
end
puts "#{SponsoredPost.count} sponsored post created"

50.times do |i|
  Post.create!(
    title: "#{i}_" + RandomData.random_sentence,
    body: "#{i}_" + RandomData.random_paragraph,
    topic: topics.sample
  )
end
puts "#{Post.count} sponsored post created"

100.times do |i|
  Comment.create!(
    post: posts.sample,
    body: "#{i}_" + RandomData.random_paragraph
  )
end
puts "#{Comment.count} sponsored post created"

puts "Seed finished"

