require 'rails_helper'
include RandomData

RSpec.describe ItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:my_item) { create(:item) }
  
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @item" do
      get :new
      expect(assigns(:item)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Item by 1" do
      expect{ post :create, item: {name: RandomData.random_sentence}}.to change(Item,:count).by(1)
    end

    it "assigns the new item to @item" do
      post :create, item: {name: RandomData.random_sentence}
      expect(assigns(:item)).to eq Item.last
    end

    it "redirects to the new item" do
      post :create, item: {name: RandomData.random_sentence}
      expect(response).to redirect_to Item.last
    end
  end
end