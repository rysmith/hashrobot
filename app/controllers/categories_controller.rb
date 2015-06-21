class CategoriesController < ApplicationController

  def index
    @tweets = Tweet.all.order(created: :desc)
  end


  def new

  end

  def create

    text_list = []

    @tweets = Tweet.all.order(created: :desc)

    @tweets.each do |t|
      text_list << t['content']
    end

    monkey_token = Figaro.env.monkey_learn_token

    #cl_5icAVzKR is the generic topic classifier
    uri = URI.parse("https://api.monkeylearn.com/v2/classifiers/cl_5icAVzKR/classify/")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)

    # Set POST data
    request.body = {
        text_list:
            text_list
    }.to_json

    # Set headers
    request.add_field("Content-Type", "application/json")
    request.add_field("Authorization", "token #{monkey_token}")

    @response = http.request(request).body

    puts @response

    redirect_to categories_path

  end

  def show

  end
end
