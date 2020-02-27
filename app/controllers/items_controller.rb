class ItemsController < ApplicationController

  def index
  end

  def buy_check
  end
  
  def show
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(new_item_params)
  end

  private
  def new_item_params
    params.require(:item).permit(:name, :price, :postage, :description, :prefecture_id, :buyer_id, :brand_id, :size_id).merge(seller_id: current_user.id)
  end

end