require 'rails_helper'

RSpec.describe User, type: :model do

  # Attributes
  
  describe "attributes" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:password_digest).of_type(:string) }
    it { should have_db_column(:role).of_type(:integer).with_options({default: 0, null: false}) }
    it { should define_enum_for(:role).with([:member, :admin]) }
  end
  
  describe 'associations' do
    it { should have_many(:posts) }
  end
  
  describe 'validation' do
    # Name Test
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(1) }
  
    # Email Test
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:email).is_at_least(3) }
    it { should allow_value("user@bloccit.com").for(:email) }
  
    # Password Test
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password}
    it { should validate_length_of(:password_digest).is_at_least(6) }
    
    # Role
    it { should validate_presence_of(:role) }
  end

end
