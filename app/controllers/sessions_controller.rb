class SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    #if true
    #  redirect_to 'el_infierno'
    #else
    #  super
    #end
    #user = User.from_omniauth(env["omniauth.auth"])
    #session[:user_id] = user.id
    ##request.env["omniauth.auth"].to_yaml
    #redirect_to edit_user_session_url
  end

  def destroy
    #session[:user_id] = nil
    #redirect_to root_url
  end

  def failure
    #redirect_to root_url, alert: "Authentication failed, please try again."
  end

end