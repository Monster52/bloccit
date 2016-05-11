require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) {User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }

  describe "after_create" do
    before do
      @another_comment = Comment.new(body: "Comment Body", post: post, user: user)
    end

    it "sends an email to users who have favorited the post" do
      favorite = user.favorites.create(post: post)
      expect(FavoriteMailer).to receive(:new_comment).with(user, post, @another_comment).and_return(double(deliver_now: true))

      @another_comment.save!
    end

    it "does not send emails to users who haen't favorited the post" do
      expect(FavoriteMailer).not_to receive(:new_comment)

      @another_comment.save!
    end
  end

  describe "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(5) }
  end

  describe "attributes" do
    it { should have_db_column(:body).of_type(:text) }
  end
  
  describe 'associations' do #Documentation http://matchers.shoulda.io/docs/v3.1.1/
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end
end
