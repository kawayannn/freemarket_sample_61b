class HomeController < ApplicationController

  def registrations

  end

  def index
    # @lady_item = Item.where(category_id: ancestry:)
    @man_item = Item.all.order(category_id: 'DESC').limit(16)
    binding.pry
  end

  
 
end
