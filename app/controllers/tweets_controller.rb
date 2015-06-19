class TweetsController < ApplicationController

  def index

    @tweets = Tweet.all.order(created: :desc)
  end

  def show

  end

  def new

  end

  def get_latest

    tweets = client.search("the -rt", lang: "en", result_type: "mixed", hashtags: true, geocode: '34.101509,-118.32691,5mi').take(50)

    tweets.each do |t|

      created = DateTime.parse(t.created_at.to_s)

      # create the tweet if it doesnt already exist
      unless Tweet.exists?(["created=?", created])

        Tweet.create({:content => t.text, :created => t.created_at })
      end
    end

    redirect_to tweets_path
  end

  def create

    client.update(tweet_params[:tweet_body])
    redirect_to new_tweet_path
  end

  private

  def tweet_params

    params.permit(:tweet_body)
  end

  def client

    Twitter::REST::Client.new do |config|

      config.consumer_key = Figaro.env.twitter_key
      config.consumer_secret = Figaro.env.twitter_secret
      config.access_token = Figaro.env.access_token
      config.access_token_secret = Figaro.env.access_token_secret
    end
  end
end