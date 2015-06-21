class CategoriesController < ApplicationController

  def index

    @categories = Category.all
  end


  def new

  end

  def create

    all_tweets = compile_tweets(Tweet)

    tweet_category = analyze_tweets(all_tweets)

    puts tweet_category
    # save_tweets(tweet_category)

    redirect_to categories_path
  end

  def show

  end

private

  # compile_tweets assumes your tweet_table has a 'content' attribute
  # returns an array of strings
  def compile_tweets(tweets_table)

    # create an empty array to store the content of each tweet
    tweet_content = []

    # get all the tweets from the db
    tweets = tweets_table.all.order(created: :desc)

    # extract the content for each tweet and push it to tweet_content
    tweets.each do |tweet|

      tweet_content << tweet['content']
    end

    # return the content of each tweet
    tweet_content
  end

  # analyse_tweets expects an array of strings
  # returns a JSON object
  def analyze_tweets(tweet_list)

    # get the monkeylearn API token from Figaro
    monkey_token = Figaro.env.monkey_learn_token

    # cl_5icAVzKR is the generic topic classifier endpoint
    uri = URI.parse("https://api.monkeylearn.com/v2/classifiers/cl_5icAVzKR/classify/")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)

    # set POST data with the content of each tweet
    # the monkeylean API expects an array of strings
    request.body = {
        text_list:
            tweet_list
    }.to_json

    # set the response type to JSON in the header
    request.add_field("Content-Type", "application/json")

    # pass in the monkeylearn API token in the header
    request.add_field("Authorization", "token #{monkey_token}")

    # return the body of the response
    http.request(request).body
  end

  # save the results from the monkeylearn API to the categories table
  def save_tweets(anaylyzed_tweets)
    result = tweet_category[0][:result]

    result.each do |t|

      Category.create({:probability => t[0][:probability], :category => t[0][:label] })
    end
  end
end
