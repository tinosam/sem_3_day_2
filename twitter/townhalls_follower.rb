require 'twitter'
require 'json'
Dotenv.load

ck = ENV['TWITTER_API_KEY']
cs = ENV['TWITTER_API_SECRET']
at = ENV['TWITTER_TOKEN']
atk = ENV['TWITTER_TOKEN_ACCESS']


CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        =ck
    config.consumer_secret     =cs
    config.access_token        =at
    config.access_token_secret =atk
end

# convertir le format json en objet ruby
 def json_to_ruby
<<<<<<< HEAD
    json = File.read('../database/test.json')
=======
    json = File.read('./database/test.json')
>>>>>>> a8fe53edfd2da2542ca07157a0cb4179d8c77afd
    obj = JSON.parse(json)
    return obj
 end
# puts json_to_ruby

#methode qui recupere les villes
def nom_ville
	nom = []
	json_to_ruby.each do |i| 
	 nom.push(i['name'])
 	end
 	nom
end
 
 puts nom_ville

# recuperation des nom d'utilisateur dans t[]
def user
		t = []
		nom_ville.each do |i|
			CLIENT.search(i).take(1).collect do |tweet|
				t.push("#{tweet.user.screen_name}") 

			end
		 end
	return t
end


#methode qui follow a partir du resultat ci-desus

	user.each do |i|
		CLIENT.follow(i)
	
	end

#handle twitter
def handle_twitter
		j = 0
		handle =[]
		user.each do |i|
		handle.push["@#{i}"]
		j +=1
	end
end

<<<<<<< HEAD
def handle
	var = json_to_ruby
	i=0
	var.each do |handle|
		nom_arobage = '@' +user[i]
	        var[i]['handle_twitter'] = nom_arobage
	    i += 1
	end
	return var
=======
def push_handle

	handle_twitter.each do |i|
		json_to_ruby[i]['handle'] = '@'+handle_twitter
	end
		
>>>>>>> a8fe53edfd2da2542ca07157a0cb4179d8c77afd
end

 File.open("test.json","w") do |f|
     f.write(handle.to_json)
 end


<<<<<<< HEAD








=======
#methode qui follow a partir du resultat ci-desus

def follow_user
	search_twitter.each do |i|
		client.follow(i)
		j +=0
	end
end
>>>>>>> a8fe53edfd2da2542ca07157a0cb4179d8c77afd
