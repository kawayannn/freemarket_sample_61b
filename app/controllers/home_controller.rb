class HomeController < ApplicationController

  def registrations

  end

  def index
    @categories = Category.roots
  end

end
