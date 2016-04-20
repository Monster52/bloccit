require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  describe "attributes" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:price).of_type(:integer) }
  end
end
