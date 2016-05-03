require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "attributes" do #Documentation http://matchers.shoulda.io/docs/v3.1.1/
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
  end
  
  describe 'associations' do
    it { should have_many(:comments).dependent(:destroy) }
    it { should belong_to(:topic) }
  end
end
