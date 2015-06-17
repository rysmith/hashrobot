class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

def show
end

end