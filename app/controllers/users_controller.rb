class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @item = Item.new
    @items = current_user.items
  end
end