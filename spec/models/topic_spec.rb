require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:public) { true }
  let(:topic) { Topic.create!(name: name, description: description) }

  it { should have_many(:posts) }

  describe "attributes" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:public).of_type(:boolean) }

    it "is public by defalut" do
      expect(topic.public).to eq(true)
    end
  end
end
