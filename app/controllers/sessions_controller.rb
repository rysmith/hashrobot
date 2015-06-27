class SessionsController < ApplicationController

  def create
    begin

      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
    rescue

      flash[:warning] = 'There was an error while trying to authenticate you...'
    end

    redirect_to hashboard_path
  end

  def destroy

    if current_user

      session.delete(:user_id)
      flash[:success] = 'See you later!'
    end

    redirect_to root_path
  end

  def auth_failure

    redirect_to root_path
  end
end
