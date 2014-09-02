class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user


  def authenticated?
    if params[:token] && user = User.find_by(authentication_token: params[:token])
      return true
    else
      raise "Unauth 401. Token invalid"
    end
  end

  def current_user
     @user ||= User.find_by(authentication_token: params[:token])
  end  
end
