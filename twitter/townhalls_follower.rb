require 'twitter'
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

# convertir le format json en objet ruby
 def json_to_ruby
    json = File.read('./database/test.json')
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
 

# recuperation des nom d'utilisateur dans t[]
def search_twitter
		t = []
		nom_ville.each do |i|
	
		client.search(i).take(1).collect do |tweet|
		t.push("#{tweet.user.screen_name}") 
		end
	end
	t
end
puts search_twitter

#handle twitter
def handle_twitter
		j = 0
		handle =[]
		search_twitter.each do |i|
		handle.push["@#{i}"]
		j +=1
	end
end

def push_handle

	handle_twitter.each do |i|
		json_to_ruby[i]['handle'] = '@'+handle_twitter
	end
		
end



#methode qui follow a partir du resultat ci-desus

def follow_user
	search_twitter.each do |i|
		client.follow(i)
		j +=0
	end
end