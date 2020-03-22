class HomeController < ApplicationController

  def registrations

  end

  def index
    @lady_item = Item.all.order(category_id: 'DESC').limit(16)
    @man_item = Item.all.order(category_id: 'DESC').limit(16)
  end

  
 
end
