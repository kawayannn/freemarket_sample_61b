class ItemsController < ApplicationController

  def index
  end

  def buy_check
  end
  
  def show
  end
  
  def new
    @item = Item.new
    @item.images.new
    @categories = Category.find(1,2,3)
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_brand
    return nil if params[:keyword] == ""
    @result = Brand.where("name LIKE ?", "%#{params[:keyword]}%")
  end

  def get_size
    @size_group = Category.find(params[:grandchild_id]).size.children
  end

  def create
    @item = Item.create(new_item_params)
  end

  private
  def new_item_params
    params.require(:item).permit(:name, :price, :postage, :description, :prefecture_id, :buyer_id, :brand_id, :size_id, :category_id, :condition, :shipment_day, images_attributes: [:src]).merge(seller_id: current_user.id)
  end

end