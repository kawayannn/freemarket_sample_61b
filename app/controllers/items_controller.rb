class ItemsController < ApplicationController
  before_action :set_item, only: [:buy_check, :buy]
  before_action :set_edit_item, only: [:edit,:update,:show]
  require 'payjp'

  def index
  end

  def buy_check
    redirect_to item_path(@item) if @item.sellout? || @item.seller_id == current_user.id
    if current_user.has_card?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      @customer = Payjp::Customer.retrieve($card.customer_id)
      @card = @customer.cards.retrieve($card.card_id)
    end
  end

  def buy
    redirect_to item_path(@item) if @item.sellout? || @item.seller_id == current_user.id
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    customer = Payjp::Customer.retrieve($card.customer_id)
    if charge = Payjp::Charge.create(
        amount: @item.price,
        customer: customer,
        card: params[:payjp_token],
        currency: 'jpy'
      )
      @item.update(status: "出品停止", buyer_id: current_user.id)
      redirect_to item_path(@item)
    end
  end
  
  def show
    
    @category = Category.find(@item.category_id)
    @user = User.find(@item.seller_id)
  end
  
  def edit
   
    @categories = Category.find(1,2,3)
    @grandchild_category = Category.find(@item.category_id)
    @prefectures = Prefecture.all
  end

  def update
    
    if @item.update(new_item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
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
    brands = Category.find(params[:grandchild_id]).brands
    @result = brands.where("name LIKE ?", "%#{params[:keyword]}%")
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

  def buy_item_params
    params.permit(:status).merge(buyer_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def set_edit_item
    @item = Item.find(params[:id])
  end
end