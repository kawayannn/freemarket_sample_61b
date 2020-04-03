class UsersController < ApplicationController


  def conform_user
    in_user
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

  private
  def set_user
    @user = User.find(params[:id])
  end
  def in_user
    @current_uset = User.where(id: current_user.id)
  end

end
