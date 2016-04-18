require 'rails_helper'

RSpec.describe Answer, type: :model do

  describe "attributes" do
    it { should have_db_column(:body).of_type(:text) }
  end
end

