require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name:"Bloccit User", email: "user@bloccit.com", password_digest: "password") }

  # Attributes
  describe "attributes" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:password_digest).of_type(:string) }

    it "responds to role" do
      expect(user).to respond_to(:role)
    end

    it "responds to admin" do
      expect(user).to respond_to(:admin?)
    end

    it "responds to member" do
      expect(user).to respond_to(:member?)
    end
  end

  describe "roles" do
    it "is a member by default" do
      expect(user.role).to eq("member")
    end

    context "member user" do
      it "returns true for #member" do
        expect(user.member?).to be_truthy
      end

      it "returns false for @admin" do
        expect(user.admin?).to be_falsey
      end
    end

    context "admin user" do
      before do
        user.admin!
      end

      it "returns true for #admin" do
        expect(user.admin?).to be_truthy
      end

      it "returns false for #member" do
        expect(user.member?).to be_falsey
      end
    end
  end

  describe 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:votes) }
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

end
