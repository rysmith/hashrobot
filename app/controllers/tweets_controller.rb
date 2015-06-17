class TweetsController < ApplicationController

  def index
    puts $client.status(167309659198328832).text
    puts $client.search("to:justinbieber marry me", result_type: "recent").take(3).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end

  def show
  end
end
