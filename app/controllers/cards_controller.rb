class CardsController < ApplicationController
  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
    if card.nil?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card = customer.cards.retrieve(card.card_id)
      card_brand = @card.brand      
      case card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    end
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

  def destroy
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      if customer.delete
        card.delete
        redirect_to action: "new"
      else
        redirect_to action: "index"
      end
    end
  end

end
