require 'rails_helper'

RSpec.describe Vote, type: :model do

  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  #let(:vote) { Vote.create!(value: 1, post: post, user: user) } The Factory vote is raising an error
  let(:vote) { create(:vote) }

  describe "validations" do
    it { should validate_presence_of(:value) }
    it { should validate_inclusion_of(:value).in_array([-1, 1]) }
  end

  describe "associations" do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

  describe "update_post callback" do
    it "triggers update_post on save" do
      expect(vote).to receive(:update_post).at_least(:once)
      vote.save!
    end

    it "#update_post should call update_rank on post" do
      expect(post).to receive(:update_rank).at_least(:once)
      vote.save!
    end
  end
end
