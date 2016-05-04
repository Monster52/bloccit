require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:sponsored) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 12)}

  describe "GET show" do
    it "returns HTTP success" do
      get :show, topic_id: my_topic.id, id: sponsored.id
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do
      get :show, topic_id: my_topic.id, id: sponsored.id
      expect(response).to render_template(:show)
    end

    it "assigns sponsored to @sponsored_post" do
      get :show, topic_id: my_topic.id, id: sponsored.id
      expect(assigns(:sponsored_post)).to eq(sponsored)
    end
  end

  describe "GET new" do
    it "returns HTTP success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instantiates @post" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Sponsored Post by 1" do
      expect{post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 19}}.to change(SponsoredPost,:count).by(1)
    end

    it "assigns the new sponsored post to @sponsored_post" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 19}
      expect(assigns(:sponsored_post)).to eq SponsoredPost.last
    end

    it "redirects to the new sponsored post" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 19}
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

  describe "GET edit" do
    it "returns HTTP success" do
      get :edit, topic_id: my_topic.id, id: sponsored.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: sponsored.id
      expect(response).to render_template :edit
    end

    it "assigns sponsored post to be udated to @sponsored_post" do
      get :edit, topic_id: my_topic.id, id: sponsored.id

      sponsored_instance = assigns(:sponsored_post)

      expect(sponsored_instance.id).to eq sponsored.id
      expect(sponsored_instance.title).to eq sponsored.title
      expect(sponsored_instance.body).to eq sponsored.body
      expect(sponsored_instance.price).to eq sponsored.price
    end
  end

  describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = 21

      put :update, topic_id: my_topic.id, id: sponsored.id, sponsored_post: {title: new_title, body: new_body, price: new_price}

      update_post = assigns(:sponsored_post)
      expect(update_post.id).to eq sponsored.id
      expect(update_post.title).to eq new_title
      expect(update_post.body).to eq new_body
      expect(update_post.price).to eq new_price
    end

    it "redirects to the updated sponsored post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = 21

      put :update, topic_id: my_topic.id, id: sponsored.id, sponsored_post: {title: new_title, body: new_body, price: new_price}

      expect(response).to redirect_to [my_topic, sponsored]
    end
  end

  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, topic_id: my_topic.id, id: sponsored.id

      count = SponsoredPost.where({id: sponsored.id}).size
      expect(count).to eq 0
    end

    it "redirects to topic show" do
      delete :destroy, topic_id: my_topic.id, id: sponsored.id
      expect(response).to redirect_to my_topic
    end
  end
end
