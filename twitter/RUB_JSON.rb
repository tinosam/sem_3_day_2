require 'twitter'
require 'dotenv'
require 'json'
Dotenv.load

ck = ENV['TWITTER_API_KEY']
cs = ENV['TWITTER_API_SECRET']
at = ENV['TWITTER_TOKEN']
atk = ENV['TWITTER_TOKEN_ACCESS']


client = Twitter::REST::Client.new do |config|
    config.consumer_key        =ck
    config.consumer_secret     =cs
    config.access_token        =at
    config.access_token_secret =atk
end
# t = []
# client.search("justinbieber").take(3).collect do |tweet|
#     t.push("#{tweet.user.screen_name}")
# end
# puts t
# t.each do |i|
#  client.follow(i)
#end

# convertir le format json en objet ruby
 def json_to_ruby
    json = File.read('email.json')
    obj = JSON.parse(json)
 end
# puts json_to_ruby

#methode qui recupere les villes
def nom_ville
nom = []
json_to_ruby.each do |i| 
	 nom.push(
		i['name']
	 )
	 nom
 end
end
 # puts nom_ville

 #methode qui cree un handle twitter
# def handle
# 	new_hash = {}
# 	handle_twitter = []
# 	json_to_ruby.each do |i|
# 		n =i['name']
		
# 		handle_twitter="@#{n}"
		
# 		handle_twitter.each do |j|
		
# 			new_hash[:name]=i['name']
# 			new_hash[:email] =i['email']
# 			new_hash[:departement]=i['departement']
# 			new_hash[:twitter] =j
# 		end

# 	end
# end
# puts handle

# puts handle


t = []
nom_ville.each do |i|
	
	client.search(i).take(0).collect do |tweet|
	t.push("#{tweet.user.screen_name}")
	end
end
puts t

#handle twitter
handle =[]
t.each do |i|
	handle.push["@#{i}"]
end

#methode qui follow a partir du resultat ci-desus
t.each do |i|
	client.follow(i)
end