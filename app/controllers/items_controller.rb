class ItemsController < ApplicationController

  def index
  end

  def new
  render layout: false #application.haml.erbを適応しない
  end

end