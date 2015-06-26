class PagesController < ApplicationController
  def index
  end

  def about
  end

  def dashboard
    @tweets = Tweet.all.order(created: :desc)
  end

  def hashboard
    uri = HTTParty.get 'http://www.hashrobot/api/categories'
    render json: JSON.parse(uri.body)
  end

end
