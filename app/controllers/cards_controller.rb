class CardsController < ApplicationController
  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
    redirect_to action: "new" if card.nil?
  end

  def new
    card = Card.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present?
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    
    if params[:payjp_token].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params[:payjp_token])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "new"
      end
    end
  end

end
