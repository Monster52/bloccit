require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:post) { Topic.create!(title: RandomData.random_sentence, body: RandomData.random_paragrapho) }
  let(:comment) { Comment.create!(body: 'Comment Body', post: post) }

  describe "attributes" do
    it { should have_db_column(:body).of_type(:text) }
  end
end
