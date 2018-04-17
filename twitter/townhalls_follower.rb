require 'twitter'
require 'dotenv'
dotenv.load


client = Twitter::REST::Client.new do |config|
    config.consumer_key        =TWITTER_API_KEY
    config.consumer_secret     =TWITTER_API_SECRET
    config.access_token        =TWITTER_TOKEN
    config.access_token_secret =TWITTER_TOKEN_ACCESS
end
t = []
client.search("justinbieber").take(3).collect do |tweet|
    t.push("#{tweet.user.screen_name}")
end
puts t
t.each do |i|
 client.follow(i)
end