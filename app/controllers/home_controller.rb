class HomeController < ApplicationController

  def registrations

  end

  def index
    @image = Image.order('src ASC').limit(10)
    @item = Item.order('price ASC').limit(10)
  end
  
  def show
  end
 
end
