require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'attributes' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:password_digest).of_type(:string) }
  end
  
  describe 'associations' do
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
  end
  
  describe 'instance methods' do
    let(:user) {User.create!(name: "bloccit user", email: "user@bloccit.com", password_digest: "password") }

    describe "fix user name to proper format" do
      it "should return the proper fomated name" do
        expect(user.name).to eq("Bloccit User")
      end
    end
  end

end
