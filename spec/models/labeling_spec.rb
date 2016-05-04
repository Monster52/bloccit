require 'rails_helper'

RSpec.describe Labeling, type: :model do

  describe "associations" do
    it { should belong_to(:labelable) }
  end

end
