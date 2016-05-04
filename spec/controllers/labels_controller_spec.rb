require 'rails_helper'

RSpec.describe LabelsController, type: :controller do
  let(:my_label) { Label.create!(name: "L1") }

  describe "GET show" do
    before { get :show, {id: my_label.id}}

    it { should respond_with(200) }
    it { should render_template(:show) }

    it "assigns my_label to @label" do
      get :show, { id: my_label.id }
      expect(assigns(:label)).to eq(my_label)
    end
  end
end
