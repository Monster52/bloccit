require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:price) { 19 }
  let(:topic_id) { 1 }

  let(:sponser){ Topic.create!(title: title, body: body, price: price, topic_id: topic_id) }

  describe "attributes" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:price).of_type(:integer) }
    it { should have_db_column(:topic_id).of_type(:integer) }
  end
end
