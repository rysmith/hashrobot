class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  helper_method :current_user

private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #restrict access to specific pages without login
  def authorize
    unless current_user
      flash[:error] = 'you must login to see that page'
      redirect_to welcome_path
    end
  end

end
