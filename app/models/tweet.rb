require 'grackle'
require 'twitter'
require "rubygems"

class Tweet < ActiveRecord::Base

  MY_APPLICATION_NAME = "jdlb"

  """Connect to the Twitter API and pull down the latest tweets"""
  def self.get_latest
    tweets = client.statuses.user_timeline? :screen_name => MY_APPLICATION_NAME # hit the API
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
    Grackle::Client.new(:ssl=>true,:auth =>{
                            :type => :oauth,
                            :consumer_key => Figaro.env.twitter_key,
                            :consumer_secret => Figaro.env.twitter_secret,
                            :token => Figaro.env.access_token,
                            :token_secret => Figaro.env.access_token_secret
                        })

  end
end

