require 'twitter'

twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = Figaro.env.twitter_key
  config.consumer_secret = Figaro.env.twitter_secret
  config.access_token = Figaro.env.access_token
  config.access_token_secret = Figaro.env.access_token_secret
end


