class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    authorization
  end

  def google_oauth2
    authorization
  end

  def failure
    redirect_to root_path
  end

  private

  def authorization
    @omniauth = request.env['omniauth.auth']
    info = User.find_oauth(@omniauth)
    @user = info[:user]
    if @user.persisted? 
      sign_in_and_redirect @user, event: :authentication
    else 
      @sns = info[:sns]
      session[:provider] = @sns[:provider]
      session[:uid] = @sns[:uid]
      
      render template: "devise/registrations/new" 
    end
  end

  # def authorization
  #   sns_info = User.from_omniauth(request.env["omniauth.auth"])
  #   @user = sns_info[:user]

  #   if @user.persisted?
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     @sns_id = sns_info[:sns].id
  #     render template: 'devise/registrations/new'
  #   end
  # end

end