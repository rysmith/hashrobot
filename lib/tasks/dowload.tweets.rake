task :download_tweets => :environment do
  Tweet.get_latest
end