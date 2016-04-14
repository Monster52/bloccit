require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) {Question.create!(title: "New Question", body: "Question Body", resolved: true) }
  let(:answer) { Comment.create!(body: 'Answer Body')}

  describe "attributes" do
    it "has body attribute" do
      expect(answer).to have_attributes(body: 'Answer Body')
    end
  end
end

