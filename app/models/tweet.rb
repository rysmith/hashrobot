class Tweet < ActiveRecord::Base

def collect_with_max_id(collection=[], max_id=nil, &block)
  response = block.call(max_id)
  collection += response
  response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
end

def $client.get_all_tweets(user)
  collect_with_max_id do |max_id|
    options = {count: 50, include_rts: true}
    options[:max_id] = max_id unless max_id.nil?
    user_timeline(user, options)
  end

end

end



