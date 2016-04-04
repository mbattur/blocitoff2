require 'rails_helper'
include RandomData

RSpec.describe ItemsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_item) { create(:item) }
  
  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  
  describe "GET #new" do
    it "returns http success" do
      get :new, user_id: my_user.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new, user_id: my_user.id
      expect(response).to render_template :new
    end
    
    it "instantiates @item" do
      get :new, user_id: my_user.id
      expect(assigns(:item)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Item by 1" do
      expect{ post :create, user_id: my_user.id, item: {name: RandomData.random_sentence}}.to change(Item,:count).by(1)
    end

    it "assigns the new item to @item" do
      post :create, user_id: my_user.id, item: {name: RandomData.random_sentence}
      expect(assigns(:item)).to eq Item.last
    end
  end
  
  describe "DELETE destroy" do
    # it "deletes the item" do
    #   delete :destroy, user_id: my_user.id, id: my_item.id
    #   count = Item.where({id: my_item.id}).size
    #   expect(count).to eq 0
    # end
    
    # it "redirects to item list" do
    #   delete :destroy, user_id: my_user.id, id: my_item.id
    #   expect(response).to redirect_to user_path(current_user)
    # end
  end
end