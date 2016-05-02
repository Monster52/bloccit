require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }

  let(:topic) { Topic.create!(name: name, description: description) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: title, body: body, user: user) }

  it { should belong_to(:topic) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:topic) }
  it { should validate_presence_of(:user) }

  it { should validate_length_of(:title).is_at_least(5) }
  it { should validate_length_of(:body).is_at_least(20) }


  describe "attributes" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:user).of_type(:string) }
  end
end
