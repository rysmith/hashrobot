class PagesController < ApplicationController
  def index
  end

  def about
  end

  def dashboard
    @tweets = Tweet.all.order(created: :desc)
  end

  def hashboard

  end

end
