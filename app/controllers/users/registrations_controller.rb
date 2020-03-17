# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
    session[:provider] = session[:provider]
    session[:uid] = session[:uid]
  end

  # POST /resource
  #1ページ目
  def create
    @user = User.new(sign_up_params)
    # バリデーションチェック
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end

    #SNSで登録する場合
    if session[:provider].present? && session[:uid].present?
      # パスワードは自動生成する
      password = Devise.friendly_token.first(7)
      session["devise.regist_data"] = {user: @user.attributes}
      @user.save
      session["devise.regist_data"][:user]["password"] = password
      params[:user][:password_confirmation] = password
      sns = SnsCredential.create(user_id: @user.id,uid: session[:uid], provider: session[:provider])
      @phone = @user.build_phone
      render :new_phone
    #メールアドレスで登録する場合
    else
      session["devise.regist_data"] = {user: @user.attributes}
      session["devise.regist_data"][:user]["password"] = params[:user][:password]
      @phone = @user.build_phone
      render :new_phone
    end
    
  end

  #2ページ目
  def create_phone
    @user = User.new(session["devise.regist_data"]["user"])
    @phone = Phone.new(phone_params)
    unless @phone.valid?
      flash.now[:alert] = @phone.errors.full_messages
      render :new_phone and return
    end
    @user.build_phone(@phone.attributes)
    @user.save
    sign_in(:user, @user)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def phone_params
    params.require(:phone).permit(:phonenumber)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
