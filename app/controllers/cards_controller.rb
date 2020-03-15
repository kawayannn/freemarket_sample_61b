class CardsController < ApplicationController
  require 'payjp'

  def new
    
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    binding.pry
    Payjp::Customer.create(card: params[:payjp_token])
  end

end
