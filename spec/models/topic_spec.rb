require 'rails_helper'

RSpec.describe Topic, type: :model do

  describe "attributes" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:public).of_type(:boolean).with_options({default: true}) }
  end
  
  describe 'associations' do
    it { should have_many(:posts).dependent(:destroy) }
  end
  
  describe 'validations' do
    #name
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(5) }
    #public
    it { should validate_presence_of(:public) }
    #description
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(15) }
  end
end
