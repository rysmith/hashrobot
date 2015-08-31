class LabelsController < ApplicationController

  def index

    @labels = Label.all
  end

  # send tweet strings to monkeylearn and save the results to the db
  def create

    tweet_content = compile_tweet_content(Tweet)

    tweet_tag = compile_tweet_tags(tweet_content)

    tweet_id = compile_tweet_id(Tweet)

    response = analyze_tweets(tweet_content)

    tweet_category_id = inject_tweet_id(response, tweet_id)

    tweet_category_id_tag = inject_tweet_tag(tweet_category_id, tweet_tag)

    save_tweets(tweet_category_id_tag)

    redirect_to dashboard_path
  end

private

  # compile_tweets assumes your tweet_table has a 'content' attribute
  # returns an array of strings
  def compile_tweet_content(tweets_table)

    # create an empty array to store the content of each tweet
    tweet_content = []

    # get all the tweets from the db
    tweets = tweets_table.connection.execute("SELECT * FROM Tweets WHERE content LIKE '%#%' ORDER BY created DESC;")

    # extract the content for each tweet and push it to tweet_content
    tweets.each do |tweet|

      tweet_content << tweet['content']
    end

    # return the content of each tweet
    tweet_content
  end

  # returns an array of integers (id of the tweets in the tweet table)
  def compile_tweet_id(tweets_table)

    # create an empty array to store the id of each tweet
    tweet_id = []

    # get all the tweets from the db
    tweets = tweets_table.connection.execute("SELECT * FROM Tweets WHERE content LIKE '%#%' ORDER BY created DESC;")

    # extract the id for each tweet and push it to tweet_id
    tweets.each do |tweet|

      tweet_id << tweet['id']
    end

    # return the id of each tweet
    tweet_id
  end

  def compile_tweet_tags(tweet_content)
    # create an empty array to store the content of each tweet
    tweet_tags = []

    # extract the content for each tweet and push it to tweet_content
    tweet_content.each do |tweet|

      tweet_tags << tweet.scan(/#[a-z1-9A-Z]+/)
    end

    # return the content of each tweet
    tweet_tags
  end

  # analyse_tweets expects an array of strings
  # returns a JSON object
  def analyze_tweets(tweet_list)

    # get the monkeylearn API token from Figaro
    monkey_token = Figaro.env.monkey_learn_token || MONKEY_LEARN_TOKEN

    # cl_5icAVzKR is the generic topic classifier endpoint
    uri = URI.parse("https://api.monkeylearn.com/v2/classifiers/cl_5icAVzKR/classify/")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)

    # set POST data with the content of each tweet
    # the monkeylean API expects an array of strings
    request.body = {text_list: tweet_list}.to_json

    # set the response type to JSON in the header
    request.add_field("Content-Type", "application/json")

    # pass in the monkeylearn API token in the header
    request.add_field("Authorization", "token #{monkey_token}")

    # parse the monkeylearn response to usable JSON
    response = JSON.parse http.request(request).body
  end

  # once the tweets have been processed add the tweet id back in
  def inject_tweet_id (response, tweet_id)

    i = 0

    response['result'].each do |t|

      t[0].merge!("id" => tweet_id[i])
      i += 1
    end
  end

  # once the tweets have been processed extract and add hash tags
  def inject_tweet_tag (response, tweet_tags)

    i = 0

    response.each do |t|

      t[0].merge!("hashtag" => tweet_tags[i])
      i += 1
    end
  end

  # save the results from the monkeylearn API to the categories table
  def save_tweets(analyzed_tweets)

    #extract the arrays of categories
    result = analyzed_tweets

    #use only the first category result for each tweet and save it to the categories table
    result.each do |t|

      Label.create({:probability => t[0]['probability'], :label => t[0]['label'], :tweet_id => t[0]['id'], :hashtag => t[0]['hashtag'] })
    end
  end
end
