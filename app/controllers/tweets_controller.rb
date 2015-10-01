class TweetsController < ApplicationController

  def index

    @tweets = Tweet.all.order(created: :desc)
  end

  def get_latest

    tweets = client.search("*.* -rt", lang: "en", result_type: "mixed", hashtags: true, geocode: tweet_loc_params[:tweet_location] + ',5mi').take(500)

    tweets.each do |t|

      created = DateTime.parse(t.created_at.to_s)

      # create the tweet if it doesnt already exist
      unless Tweet.exists?(["created=?", created])

        Tweet.create({:content => t.text, :created => t.created_at })
      end
    end

    redirect_to dashboard_path
  end

  def create

    client.update(tweet_params[:tweet_body])

    redirect_to hashboard_path
  end

private

  def tweet_params

    params.permit(:tweet_body)
  end

  def tweet_loc_params

    params.permit(:tweet_location)
  end

  def client

    Twitter::REST::Client.new do |config|

      config.consumer_key = Figaro.env.twitter_key
      config.consumer_secret = Figaro.env.twitter_secret
      config.access_token = current_user.token
      config.access_token_secret = current_user.secret
    end
  end
end
