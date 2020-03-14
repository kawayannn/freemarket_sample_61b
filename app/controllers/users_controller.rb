class UsersController < ApplicationController

  require 'payjp'

  def conform_user
  end

  def logout
  end

  def conform_card
  end

  def edit_profile
  end

  def mypage
  end

  def registrations
  end

  def pay
    Payjp.api_key =  Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    binding.pry
    Payjp::Customer.create(card: params[:payjp_token])
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
