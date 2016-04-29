require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }

  describe "GET index" do
    before { get :index }
    it { should respond_with(200)}

    it "assigns [my_topic] to @topics" do
      get :index
      expect(assigns(:topics)).to eq([my_topic])
    end
  end

  describe "GET show" do
    before { get :show, {id: my_topic.id} }
    it { should respond_with(200) }
    it { should render_template('show') }

    it "assigns my_topic to @topic" do
      get :show, {id: my_topic.id}
      expect(assigns(:topic)).to eq(my_topic)
    end
  end

  describe "GET new" do
    before { get :new }

    it { should respond_with(200) }
    it { should render_template('new') }

    it "initializes @topic" do
      get :new
      expect(assigns(:topic)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of topics by 1" do
      expect{ post :create, {topic: {name: RandomData.random_sentence, description: RandomData.random_paragraph}}}.to change(Topic,:count).by(1)
    end

    it "assigns Topic.last to @topic" do
      post :create, {topic: {name: RandomData.random_sentence, description: RandomData.random_paragraph}}
      expect(assigns(:topic)).to eq Topic.last
    end

    it "redirects to the new topic" do
      post :create, {topic: {name: RandomData.random_sentence, description: RandomData.random_paragraph}}
      expect(response).to redirect_to Topic.last
    end
  end

  describe "GET edit" do
    before { get :edit, {id: my_topic.id} }
    it { should respond_with(200) }
    it { should render_template('edit') }

    it "assigns topic to be updated to @topic" do
      get :edit, {id: my_topic.id}
      topic_instance = assigns(:topic)

      expect(topic_instance.id).to eq my_topic.id
      expect(topic_instance.name).to eq my_topic.name
      expect(topic_instance.description).to eq my_topic.description
    end
  end

  describe "PUT update" do
    it "updates topic with expected attributes" do
      new_name = RandomData.random_sentence
      new_description = RandomData.random_paragraph

      put :update, id: my_topic.id, topic: { name: new_name, description: new_description }

      update_topic = assigns(:topic)
      expect(update_topic.id).to eq my_topic.id
      expect(update_topic.name).to eq new_name
      expect(update_topic.description).to eq new_description
    end

    it "redirects to the updated topic" do
      new_name = RandomData.random_sentence
      new_description = RandomData.random_paragraph

      put :update, id: my_topic.id, topic: { name: new_name, description: new_description }
      expect(response).to redirect_to my_topic
    end
  end

  describe "DELETE destroy" do
    it "deletes the topic" do
      delete :destroy, {id: my_topic.id}
      count = Topic.where({id: my_topic.id}).size
      expect(count).to eq 0
    end

    it "redirects to topics index" do
      delete :destroy, {id: my_topic.id}
      expect(response).to redirect_to topics_path
    end
  end
end
