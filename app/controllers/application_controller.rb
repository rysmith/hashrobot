class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user



  $client = Twitter::REST::Client.new do |config|
    config.consumer_key = Figaro.env.twitter_key
    config.consumer_secret = Figaro.env.twitter_secret
    config.access_token = Figaro.env.access_token
    config.access_token_secret = Figaro.env.access_token_secret
  end

  require 'twitter'

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end

