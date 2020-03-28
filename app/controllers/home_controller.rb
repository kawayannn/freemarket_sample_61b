class HomeController < ApplicationController

  def registrations

  end

  def index
    @categories = Category.roots
    # @man_item = Item.all.order(category_id: 'DESC').limit(16)
    # binding.pry
  end

end
