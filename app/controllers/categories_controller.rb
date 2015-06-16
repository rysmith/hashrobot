class CategoriesController < ApplicationController
  def index

    monkey_token = Figaro.env.monkey_learn_token

    uri = URI.parse("https://api.monkeylearn.com/v2/classifiers/cl_5icAVzKR/classify/")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)

    # Set POST data
    request.body = {
        text_list:
            [
              "I am so happy to announce my new partnership with Pantene! #SelenaxPantene #strongisbeautiful @Pantene",
              "Alarm is mounting in South Korea over Middle East Respiratory Syndrome http://econ.st/1HLyfCu"
            ]}.to_json

    # Set headers
    request.add_field("Content-Type", "application/json")
    request.add_field("Authorization", "token #{monkey_token}")

    render text: http.request(request).body
  end

  def show
  end
end
