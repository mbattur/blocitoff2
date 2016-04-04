class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create(item_params)
    @item.user = current_user
    
    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "There was an error saving the item. Please try again."
      render :new
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "Item was deleted successfully."
    else
      flash[:alert] = "There was an error deleting the item."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit([:name])
  end
end