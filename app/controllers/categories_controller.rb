class CategoriesController < ApplicationController

  def index
    @tweets = Tweet.all.order(created: :desc)
  end


  def new

  end

  def create

    #get the monkeylearn API token from Figaro
    monkey_token = Figaro.env.monkey_learn_token

    #create an empty array to store the content of each tweet
    tweet_content = []

    #get all the tweets from the db
    tweets = Tweet.all.order(created: :desc)

    #cl_5icAVzKR is the generic topic classifier endpoint
    uri = URI.parse("https://api.monkeylearn.com/v2/classifiers/cl_5icAVzKR/classify/")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)

    #extract the content for each tweet and push it to tweet_content
    tweets.each do |tweet|

      tweet_content << tweet['content']
    end

    # Set POST data with the content of each tweet
    request.body = {
        text_list:
            tweet_content
    }.to_json

    #set the response type to JSON in the header
    request.add_field("Content-Type", "application/json")

    #pass in the monkeylearn API token in the header
    request.add_field("Authorization", "token #{monkey_token}")

    #get the body of the response
    @response = http.request(request).body

    puts @response

    redirect_to categories_path

  end

  def show

  end
end
