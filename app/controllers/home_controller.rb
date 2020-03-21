class HomeController < ApplicationController

  def registrations

  end

  def index
    @lady_item = Item.where(category_id:1).order(category_id: 'DESC').limit(16)
    # @man_item = Item.where(category_id:2).order(:id 'DESC').limit(10)
    # @category= Category.all
  end

  
 
end
