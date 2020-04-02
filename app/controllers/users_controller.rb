class UsersController < ApplicationController


  def conform_user
  end

  def logout
  end

  def conform_card
  end

  def edit_profile
  end

  def mypage
    @user = User.find(params[id: current_user.id])
  end

  def registrations
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
