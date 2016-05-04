require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:topic) }
    it { should validate_presence_of(:user) }

    it { should validate_length_of(:title).is_at_least(5) }
    it { should validate_length_of(:body).is_at_least(20) }
  end


  describe "attributes" do #Documentation http://matchers.shoulda.io/docs/v3.1.1/
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

  describe "associations" do
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:labelings) }
    it { should have_many(:labels).through(:labelings) }
    it { should belong_to(:topic) }
    it { should belong_to(:user) }
  end
end
