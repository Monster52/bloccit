require 'rails_helper'

RSpec.describe Question, type: :model do
  let (:question) { Question.create!(title: "New Q title", body: "New Q body", resolved: true) }

  describe "attributes" do
    it "has title attributes" do
      expect(question).to have_attributes(title: "New Q title")
    end

    it "has body attributes" do
      expect(question).to have_attributes(body: "New Q body")
    end

    it "has resolved attributes" do
      expect(question).to have_attributes(resolved: true)
    end
  end
end
