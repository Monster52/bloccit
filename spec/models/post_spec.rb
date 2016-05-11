require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "attributes" do #Documentation http://matchers.shoulda.io/docs/v3.1.1/
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
  end

  describe "associations" do
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:votes) }
    it { should have_many(:labelings) }
    it { should have_many(:labels).through(:labelings) }
    it { should belong_to(:topic) }
    it { should belong_to(:user) }
  end
  
  describe 'validation' do
    #title
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(5) }
    #body
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(20) }
    #topic
    it { should validate_presence_of(:topic) }
  end
  
  describe "voting" do
    let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
    let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
    let(:post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, topic: topic, user: user) }
    before do
      3.times { post.votes.create!(value: 1) }
      2.times { post.votes.create!( value: -1) }
      @up_votes = post.votes.where(value: 1).count
      @down_votes = post.votes.where(value: -1).count
    end

    describe "#up_votes" do
      it "counts the number of votes with value = 1" do
        expect( post.up_votes ).to eq(@up_votes)
      end
    end

    describe "#down_votes" do
      it "counts the number of votes with value = -1" do
        expect( post.down_votes ).to eq(@down_votes)
      end
    end

    describe "#points" do
      it "returns the sum of all down and up votes" do
        expect( post.points ).to eq(@up_votes - @down_votes)
      end
    end

    describe "#update_rank" do
      it "calculates the correct rank" do
        post.update_rank
        expect(post.rank).to eq(post.points + (post.created_at - Time.new(1970,1,1)) / 1.day.seconds)
      end

      it "updates the rank when an up bote is created" do
        old_rank = post.rank
        post.votes.create!(value: 1)
        expect(post.rank).to eq(old_rank + 1)
      end

      it "updates the rank when a down vote is created" do
        old_rank = post.rank
        post.votes.create!(value: -1)
        expect(post.rank).to eq(old_rank - 1)
      end
    end
  end

  describe "attributes" do #Documentation http://matchers.shoulda.io/docs/v3.1.1/
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
  end

  describe "associations" do
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:votes) }
    it { should have_many(:labelings) }
    it { should have_many(:labels).through(:labelings) }
    it { should have_many(:favorites) }
    it { should belong_to(:topic) }
    it { should belong_to(:user) }
  end
  
  describe 'validation' do
    #title
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(5) }
    #body
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(20) }
    #topic
    it { should validate_presence_of(:topic) }
  end
end
