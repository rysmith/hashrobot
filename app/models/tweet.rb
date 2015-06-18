require 'twitter'

class Tweet < ActiveRecord::Base

  def self.get_latest

    tweets = client.search("los angeles", result_type: "recent").take(3)

    tweets.each do |t|
      # Tweet.create({:content => t.text, :created => created })
      # created = DateTime.parse(t.created_at)
      # create the tweet if it doesn't already exist
      # unless Tweet.exists?(["created=?", created])
        Tweet.create({:content => t.text, :created => t.created_at })
      # end
    end
  end

private

  def self.client

    Twitter::REST::Client.new do |config|
      config.consumer_key = Figaro.env.twitter_key
      config.consumer_secret = Figaro.env.twitter_secret
      config.access_token = Figaro.env.access_token
      config.access_token_secret = Figaro.env.access_token_secret
    end

  end
end

