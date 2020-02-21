class ItemsController < ApplicationController

  def index
  end

  def new
  render layout: false #spplication.haml.erbを適応しない
  end

end