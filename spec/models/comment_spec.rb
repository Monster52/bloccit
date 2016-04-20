require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe "attributes" do
    it { should have_db_column(:body).of_type(:text) }
  end
  
  describe 'associations' do #Documentation http://matchers.shoulda.io/docs/v3.1.1/
    it { should belong_to(:post) }
  end
end
